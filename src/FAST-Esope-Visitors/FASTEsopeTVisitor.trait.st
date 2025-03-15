"
A trait adding default visit method for the FASTEsope entities

Note: There should be a trait for visiting FASTFortran entities also
"
Trait {
	#name : 'FASTEsopeTVisitor',
	#category : 'FAST-Esope-Visitors-Trait',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Trait'
}

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeIncludeStatement: aFASTEsopeIncludeStatement [ 

]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopePointerDeclarationStatement: aFASTEsopePointerDeclaration [

	aFASTEsopePointerDeclaration pointerDeclarators do: [ :declarator |
		declarator accept: self
	]
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopePointerDeclarator: aFASTEsopePointerDeclarator [

	aFASTEsopePointerDeclarator variableDeclarator accept: self
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopePointerType: aFASTEsopePointerType [

]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSeg: aFASTEsopeSegCommand command: commandName [

	aFASTEsopeSegCommand variables do: [ :variable |
		variable accept: self
	]
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegact: aFASTEsopeSegact [

	self visitFASTEsopeSeg: aFASTEsopeSegact command: 'segact'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegadj: aFASTEsopeSegadj [

	self visitFASTEsopeSeg: aFASTEsopeSegadj command: 'segadj'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegcop: aFASTEsopeSegcop [

	self visitFASTEsopeSeg: aFASTEsopeSegcop command: 'segcop'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegdes: aFASTEsopeSegdes [

	self visitFASTEsopeSeg: aFASTEsopeSegdes command: 'segdes'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegini: aFASTEsopeSegini [ 

	self visitFASTEsopeSeg: aFASTEsopeSegini command: 'segini'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	aFASTEsopeSegment statements do: [ :each | each accept: self ].

]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegmov: aFASTEsopeSegmov [

	self visitFASTEsopeSeg: aFASTEsopeSegmov command: 'segmov'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegprt: aFASTEsopeSegprt [

	self visitFASTEsopeSeg: aFASTEsopeSegprt command: 'segprt'
]

{ #category : 'visiting' }
FASTEsopeTVisitor >> visitFASTEsopeSegsup: aFASTEsopeSegsup [

	self visitFASTEsopeSeg: aFASTEsopeSegsup command: 'segsup'
]
