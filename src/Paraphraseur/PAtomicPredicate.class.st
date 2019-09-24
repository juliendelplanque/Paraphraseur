Class {
	#name : #PAtomicPredicate,
	#superclass : #TQAtomicPredicate,
	#category : #Paraphraseur
}

{ #category : #testing }
PAtomicPredicate >> matches: aTQNodeWrapper [
	^ self value: aTQNodeWrapper wrappedNode
]
