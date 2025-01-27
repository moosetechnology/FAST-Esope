Class {
	#name : 'FASTEsopeExporterVisitor',
	#superclass : 'FASTFortranExporterVisitor',
	#category : 'FAST-Esope-Visitors-Export',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Export'
}

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeIncludeStatement: aFASTEsopeIncludeStatement [ 

	self
		<< '%inc "' ;
		<< aFASTEsopeIncludeStatement filename ;
		<< '"' ;
		newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerDeclarationStatement: aFASTEsopePointerDeclaration [

	self
		sixSpaces ;
		<< 'pointeur '.
		
	self visitNodeListSeparatedByCommas:	aFASTEsopePointerDeclaration pointerDeclarators.
	self newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerDeclarator: aFASTEsopePointerDeclarator [

	aFASTEsopePointerDeclarator variableDeclarator accept: self.
	self
		<< '.' ;
		<< aFASTEsopePointerDeclarator pointedTypeName
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerStatement: aFASTEsopePointerStatement [

	self
		sixSpaces ;
		<< aFASTEsopePointerStatement command ;
		<< ',' ;
		<< aFASTEsopePointerStatement pointerVariable ;
		newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerType: aFASTEsopePointerType [

		self << aFASTEsopePointerType name
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSeg: aFASTEsopeSegCommand command: commandName [

	self
		sixSpaces ;
		<< commandName ;
		<< ',' ;
		visitNodeListSeparatedByCommas: aFASTEsopeSegCommand variables ;
		newLine
		
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegact: aFASTEsopeSegact [

	self visitFASTEsopeSeg: aFASTEsopeSegact command: 'segact'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegadj: aFASTEsopeSegadj [

	self visitFASTEsopeSeg: aFASTEsopeSegadj command: 'segadj'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegcop: aFASTEsopeSegcop [

	self visitFASTEsopeSeg: aFASTEsopeSegcop command: 'segcop'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegdes: aFASTEsopeSegdes [

	self visitFASTEsopeSeg: aFASTEsopeSegdes command: 'segdes'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegini: aFASTEsopeSegini [ 

	self visitFASTEsopeSeg: aFASTEsopeSegini command: 'segini'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	self
		sixSpaces ;
		<< 'segment,' ;
		<< aFASTEsopeSegment name ;
		newLine.

	aFASTEsopeSegment statements do: [ :each | each accept: self ].
	
	self
		sixSpaces ;
		<< 'end segment' ;
		newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegmov: aFASTEsopeSegmov [

	self visitFASTEsopeSeg: aFASTEsopeSegmov command: 'segmov'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegprt: aFASTEsopeSegprt [

	self visitFASTEsopeSeg: aFASTEsopeSegprt command: 'segprt'
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeSegsup: aFASTEsopeSegsup [

	self visitFASTEsopeSeg: aFASTEsopeSegsup command: 'segsup'
]
