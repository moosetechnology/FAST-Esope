Extension { #name : 'FASTEsopeIncludeStatement' }

{ #category : '*FAST-Esope-Visitors' }
FASTEsopeIncludeStatement >> accept: aVisitor [

	^ aVisitor visitFASTEsopeIncludeStatement: self.

]
