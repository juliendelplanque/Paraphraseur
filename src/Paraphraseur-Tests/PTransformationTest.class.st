"
A PTransformationTest is a test class for testing the behavior of PTransformation
"
Class {
	#name : #PTransformationTest,
	#superclass : #TestCase,
	#category : #'Paraphraseur-Tests'
}

{ #category : #mock }
PTransformationTest >> adding [
	| x |
	^ 3 + x * 5 + 2
]

{ #category : #tests }
PTransformationTest >> testMessageRename [
	| ast transformation newAst |
	ast := (self class >> #adding) ast.
	
	transformation := PTransformation new
	predicate: (PMessageNodePredicate selector: #+);
	template: (PCGMessageNode
					receiver: (#match asPCGTemplateParameter => [ :n | n receiver ])
					selector: #add:
					with: (#match asPCGTemplateParameter => [ :n | n arguments ]));
	yourself.
	
	newAst := transformation transform: ast.
	
	self assert: newAst sourceCode equals: 'adding
	| x |
	^ (3 add: x) * 5 add: 2'
	
]

{ #category : #tests }
PTransformationTest >> testSwapArgumentAndReceiver [
	| ast transformation newAst |
	ast := (self class >> #adding) ast.
	
	transformation := PTransformation new
	predicate: (PMessageNodePredicate selector: #+);
	template: (PCGMessageNode
					receiver: (#match asPCGTemplateParameter => [ :n | n arguments first ])
					selector: #+
					with: (#match asPCGTemplateParameter => [ :n | { n receiver } ]));
	yourself.
	
	newAst := transformation transform: ast.
	
	self assert: newAst sourceCode equals: 'adding
	| x |
	^ 2 + ((x + 3) * 5)'
	
]
