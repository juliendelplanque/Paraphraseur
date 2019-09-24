Class {
	#name : #PTransformation,
	#superclass : #Object,
	#instVars : [
		'predicate',
		'template'
	],
	#category : #Paraphraseur
}

{ #category : #accessing }
PTransformation >> predicate [
	^ predicate
]

{ #category : #accessing }
PTransformation >> predicate: anObject [
	predicate := anObject asTQPredicate
]

{ #category : #accessing }
PTransformation >> template [
	^ template
]

{ #category : #accessing }
PTransformation >> template: anObject [
	template := anObject
]

{ #category : #accessing }
PTransformation >> transform: anAST [
	| matchedNodes astToWorkOn |
	astToWorkOn := anAST asPCGAST.
	PCGParentSetter visit: astToWorkOn.
	matchedNodes := TreeQuery depthFirst collectMatches
		predicate: self predicate;
		runOn: astToWorkOn childrenBlock: #children.
		
	(matchedNodes sorted: #depth asSortFunction reversed) do: [ :node |
		|slot|
		slot := node parent slotFor: node.
		node parent
			perform: slot name asMutator
			with: (self template substituteParametersWith: { #match -> node }) ].
	^ astToWorkOn
]
