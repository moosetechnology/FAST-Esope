Extension { #name : 'FASTFortranVariableDeclarationStatement' }

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarationStatement >> pointerDeclarationStatement [
	"Relation named: #pointerDeclarationStatement type: #FASTEsopePointerDeclarationStatement opposite: #variableDeclarationStatements"

	<generated>
	<FMProperty: #pointerDeclarationStatement type: #FASTEsopePointerDeclarationStatement opposite: #variableDeclarationStatements>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #pointerDeclarationStatement ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarationStatement >> pointerDeclarationStatement: anObject [

	<generated>
	self attributeAt: #pointerDeclarationStatement put: (FMMultivalueLink on: self update: #variableDeclarationStatements from: self pointerDeclarationStatement to: anObject).
]
