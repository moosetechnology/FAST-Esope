Extension { #name : 'FASTFortranVariableDeclarationStatement' }

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarationStatement >> pointeurDeclarationStatement [
	"Relation named: #pointeurDeclarationStatement type: #FASTEsopePointeurDeclarationStatement opposite: #variableDeclarationStatements"

	<generated>
	<FMProperty: #pointeurDeclarationStatement type: #FASTEsopePointeurDeclarationStatement opposite: #variableDeclarationStatements>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #pointeurDeclarationStatement ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariableDeclarationStatement >> pointeurDeclarationStatement: anObject [

	<generated>
	self attributeAt: #pointeurDeclarationStatement put: (FMMultivalueLink on: self update: #variableDeclarationStatements from: self pointeurDeclarationStatement to: anObject).
]
