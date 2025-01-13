Extension { #name : 'FASTEsopePointerDeclarator' }

{ #category : '*FAST-Esope-Visitors' }
FASTEsopePointerDeclarator >> accept: aVisitor [

	^ aVisitor visitFASTEsopePointerDeclarator: self.

]
