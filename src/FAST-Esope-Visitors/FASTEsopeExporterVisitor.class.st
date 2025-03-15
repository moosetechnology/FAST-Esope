Class {
	#name : 'FASTEsopeExporterVisitor',
	#superclass : 'FASTFortranExporterVisitor',
	#traits : 'FASTEsopeTVisitor',
	#classTraits : 'FASTEsopeTVisitor classTrait',
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
