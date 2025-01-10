"
pointeur p1.SEG, p2.OTHER_SEG, ..., pN.SEG with N=1, 2, 3,...

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableDeclarationStatements` | `FASTEsopePointeurDeclarationStatement` | `pointeurDeclarationStatement` | `FASTFortranVariableDeclarationStatement` | |



"
Class {
	#name : 'FASTEsopePointeurDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopePointeurDeclarationStatement class >> annotation [

	<FMClass: #PointeurDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTEsopePointeurDeclarationStatement >> addVariableDeclarationStatement: anObject [
	<generated>
	^ self variableDeclarationStatements add: anObject
]

{ #category : 'accessing' }
FASTEsopePointeurDeclarationStatement >> variableDeclarationStatements [
	"Relation named: #variableDeclarationStatements type: #FASTFortranVariableDeclarationStatement opposite: #pointeurDeclarationStatement"

	<generated>
	<derived>
	<FMProperty: #variableDeclarationStatements type: #FASTFortranVariableDeclarationStatement opposite: #pointeurDeclarationStatement>
	^ self attributeAt: #variableDeclarationStatements ifAbsentPut: [ FMMultivalueLink on: self opposite: #pointeurDeclarationStatement: ]
]

{ #category : 'accessing' }
FASTEsopePointeurDeclarationStatement >> variableDeclarationStatements: anObject [

	<generated>
	self variableDeclarationStatements value: anObject
]
