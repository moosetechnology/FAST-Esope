Class {
	#name : #FASTEsopeVisitor,
	#superclass : #FASTFortranVisitor,
	#category : #'FAST-Esope-Visitor'
}

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopeEntity: aFASTEsopeEntity [
	<generated>
	self visitFASTFortranTEntity: aFASTEsopeEntity.
]

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopeInclude: aFASTEsopeInclude [
	<generated>
	self visitFASTFortranTStatement: aFASTEsopeInclude.
]

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopePointerDeclaration: aFASTEsopePointerDeclaration [

	^self visitFASTFortranDeclarationStatement: aFASTEsopePointerDeclaration
]

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopePointerStatement: aFASTEsopePointerStatement [
	<generated>
	self visitFASTFortranTStatement: aFASTEsopePointerStatement.
]

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopePointerType: aFASTEsopePointerType [

	^self visitFASTFortranType: aFASTEsopePointerType
]

{ #category : #visiting }
FASTEsopeVisitor >> visitFASTEsopeSegment: aFASTEsopeSegment [

	^self visitFASTFortranTStatement: aFASTEsopeSegment
]
