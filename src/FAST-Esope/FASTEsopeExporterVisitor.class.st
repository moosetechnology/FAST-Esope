Class {
	#name : #FASTEsopeExporterVisitor,
	#superclass : #FASTFortranExporterVisitor,
	#category : #'FAST-Esope-Visitor'
}

{ #category : #visiting }
FASTEsopeExporterVisitor >> visitFASTEsopeInclude: aFASTEsopeInclude [
	<generated>
	self visitFASTFortranTStatement: aFASTEsopeInclude.
]

{ #category : #visiting }
FASTEsopeExporterVisitor >> visitFASTEsopePointerDeclaration: aFASTEsopePointerDeclaration [

	self
		sixSpaces ;
		<< 'pointeur '.
	aFASTEsopePointerDeclaration declarators first accept: self.
	self << '.'.
	aFASTEsopePointerDeclaration type accept: self.
	self newLine
]

{ #category : #visiting }
FASTEsopeExporterVisitor >> visitFASTEsopePointerStatement: aFASTEsopePointerStatement [
	<generated>
	self visitFASTFortranTStatement: aFASTEsopePointerStatement.
]

{ #category : #visiting }
FASTEsopeExporterVisitor >> visitFASTEsopePointerType: aFASTEsopePointerType [

		self << aFASTEsopePointerType name
]

{ #category : #visiting }
FASTEsopeExporterVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	^self visitFASTFortranTStatement: aFASTEsopeSegment
]
