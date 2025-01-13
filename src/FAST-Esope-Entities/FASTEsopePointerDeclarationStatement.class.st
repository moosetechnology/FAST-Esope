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
| `pointerDeclarators` | `FASTEsopePointerDeclarationStatement` | `pointerDeclarationStatement` | `FASTEsopePointerDeclarator` | |



"
Class {
	#name : 'FASTEsopePointerDeclarationStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#traits : 'FASTFortranTDeclaration',
	#classTraits : 'FASTFortranTDeclaration classTrait',
	#instVars : [
		'#pointerDeclarators => FMMany type: #FASTEsopePointerDeclarator opposite: #pointerDeclarationStatement'
	],
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
FASTEsopePointerDeclarationStatement >> addPointerDeclarator: anObject [
	<generated>
	^ self pointerDeclarators add: anObject
]

{ #category : 'accessing' }
FASTEsopePointerDeclarationStatement >> pointerDeclarators [
	"Relation named: #pointerDeclarators type: #FASTEsopePointerDeclarator opposite: #pointerDeclarationStatement"

	<generated>
	<derived>
	^ pointerDeclarators
]

{ #category : 'accessing' }
FASTEsopePointerDeclarationStatement >> pointerDeclarators: anObject [

	<generated>
	pointerDeclarators value: anObject
]
