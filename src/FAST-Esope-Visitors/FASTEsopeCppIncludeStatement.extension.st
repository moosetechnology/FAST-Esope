Extension { #name : 'FASTEsopeCppIncludeStatement' }

{ #category : '*FAST-Esope-Visitors' }
FASTEsopeCppIncludeStatement >> accept: aVisitor [

	^ aVisitor visitFASTEsopeCppIncludeStatement: self.

]
