Class {
	#name : 'FASTEsopeExporterVisitor',
	#superclass : 'FASTFortranExporterVisitor',
	#category : 'FAST-Esope-Visitors-Export',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Export'
}

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopeCppIncludeStatement: aFASTEsopeCppIncludeStatement [ 

	self
		<< '#include "' ;
		<< aFASTEsopeCppIncludeStatement filename ;
		<< '"' ;
		newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointedType: aFASTEsopePointedType [ 

	self
		<< '.' ;
		<< aFASTEsopePointedType name
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerDeclaration: aFASTEsopePointerDeclaration [

	self
		sixSpaces ;
		<< 'pointeur '.
	aFASTEsopePointerDeclaration declarators first accept: self.
	self << '.'.
	aFASTEsopePointerDeclaration type accept: self.
	self newLine
]

{ #category : 'visiting' }
FASTEsopeExporterVisitor >> visitFASTEsopePointerDeclarationStatement: aFASTEsopePointerDeclaration [

	self
		sixSpaces ;
		<< 'pointeur '.
	aFASTEsopePointerDeclaration variableDeclarationStatements first accept: self.
	self newLine
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
FASTEsopeExporterVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	self
		sixSpaces ;
		<< 'segment,' ;
		<< aFASTEsopeSegment name ;
		newLine.

	aFASTEsopeSegment members do: [ :each | each accept: self ].
	
	self
		sixSpaces ;
		<< 'end segment' ;
		newLine
]
