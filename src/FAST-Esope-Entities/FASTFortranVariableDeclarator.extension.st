Extension { #name : 'FASTFortranVariableDeclarator' }

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarator >> pointerDeclarator [
	"Relation named: #pointerDeclarator type: #FASTEsopePointerDeclarator opposite: #variableDeclarator"

	<generated>
	<derived>
	<FMProperty: #pointerDeclarator type: #FASTEsopePointerDeclarator opposite: #variableDeclarator>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #pointerDeclarator ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarator >> pointerDeclarator: anObject [

	<generated>
	(self attributeAt: #pointerDeclarator ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self pointerDeclarator.
		self attributeAt: #pointerDeclarator put: anObject.
		otherSide variableDeclarator: nil ]
	ifNotNil: [ 
		self attributeAt: #pointerDeclarator put: anObject.
		anObject variableDeclarator: self ]
]
