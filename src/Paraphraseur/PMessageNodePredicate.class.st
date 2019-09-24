Class {
	#name : #PMessageNodePredicate,
	#superclass : #TQAtomicPredicate,
	#instVars : [
		'selector'
	],
	#category : #Paraphraseur
}

{ #category : #'instance creation' }
PMessageNodePredicate class >> selector: selector [
	^ self new
		selector: selector;
		yourself
]

{ #category : #testing }
PMessageNodePredicate >> matches: aTQNodeWrapper [
	^ aTQNodeWrapper wrappedNode isMessage and: [ aTQNodeWrapper wrappedNode selector = self selector ]
]

{ #category : #accessing }
PMessageNodePredicate >> selector [
	^ selector
]

{ #category : #accessing }
PMessageNodePredicate >> selector: anObject [
	selector := anObject
]
