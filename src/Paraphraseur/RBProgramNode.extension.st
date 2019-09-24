Extension { #name : #RBProgramNode }

{ #category : #'*Paraphraseur' }
RBProgramNode >> slotFor: aChildNode [
	^ self class slots detect: [ :s |
		|slotValue|
		slotValue := s read: self.
		(slotValue isCollection
			and: [ slotValue includes: aChildNode ])
				or: [ slotValue = aChildNode ] ]
]
