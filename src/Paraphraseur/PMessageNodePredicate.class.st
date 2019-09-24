Class {
	#name : #PMessageNodePredicate,
	#superclass : #PAtomicPredicate,
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

{ #category : #accessing }
PMessageNodePredicate >> selector [
	^ selector
]

{ #category : #accessing }
PMessageNodePredicate >> selector: anObject [
	selector := anObject
]

{ #category : #testing }
PMessageNodePredicate >> value: aNode [
	^ aNode isMessage and: [ aNode selector = self selector ]
]
