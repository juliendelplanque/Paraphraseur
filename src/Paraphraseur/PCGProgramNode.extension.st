Extension { #name : #PCGProgramNode }

{ #category : #'*Paraphraseur' }
PCGProgramNode >> depth [
	^ (self parentsIterator
		outputTo: (0 injectItInto: [ :sum :current |
			sum + 1 ])) next
]

{ #category : #'*Paraphraseur' }
PCGProgramNode >> parentsIterator [
	^ LinkedListIterator on: self nextLinkBlock: #parent
]

{ #category : #'*Paraphraseur' }
PCGProgramNode >> slotFor: aChildNode [
	^ self class slots detect: [ :s |
		|slotValue|
		slotValue := s read: self.
		(slotValue isCollection
			and: [ slotValue includes: aChildNode ])
				or: [ slotValue = aChildNode ] ]
]
