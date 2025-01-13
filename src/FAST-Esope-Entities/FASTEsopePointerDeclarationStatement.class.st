"
pointeur p1.SEG, p2.OTHER_SEG, ..., pN.SEG with N=1, 2, 3,...

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fortranDeclarationOwner` | `FASTFortranTDeclaration` | `declarations` | `FASTFortranTWithDeclarations` | The element that declares me|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variableDeclarationStatements` | `FASTEsopePointerDeclarationStatement` | `pointerDeclarationStatement` | `FASTFortranVariableDeclarationStatement` | |



"
Class {
	#name : 'FASTEsopePointerDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTDeclaration',
	#classTraits : 'FASTFortranTDeclaration classTrait',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopePointerDeclarationStatement class >> annotation [

	<FMClass: #PointerDeclarationStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTEsopePointerDeclarationStatement >> addVariableDeclarationStatement: anObject [
	<generated>
	^ self variableDeclarationStatements add: anObject
]

{ #category : 'accessing' }
FASTEsopePointerDeclarationStatement >> variableDeclarationStatements [
	"Relation named: #variableDeclarationStatements type: #FASTFortranVariableDeclarationStatement opposite: #pointerDeclarationStatement"

	<generated>
	<derived>
	<FMProperty: #variableDeclarationStatements type: #FASTFortranVariableDeclarationStatement opposite: #pointerDeclarationStatement>
	^ self attributeAt: #variableDeclarationStatements ifAbsentPut: [ FMMultivalueLink on: self opposite: #pointerDeclarationStatement: ]
]

{ #category : 'accessing' }
FASTEsopePointerDeclarationStatement >> variableDeclarationStatements: anObject [

	<generated>
	self variableDeclarationStatements value: anObject
]
