Class {
	#name : #PNilAssignmentPredicate,
	#superclass : #PAtomicPredicate,
	#category : #Paraphraseur
}

{ #category : #accessing }
PNilAssignmentPredicate class >> value: aNode [
	^ self new value: aNode
]

{ #category : #testing }
PNilAssignmentPredicate >> value: aNode [
	^ aNode isAssignment and: [ aNode value isLiteralValue and: [ aNode value value isNil ] ] 
]
