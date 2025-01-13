"
A declarator for one ""pointeur"" and its segment type in a PointerDeclarationStatement

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `pointerDeclarationStatement` | `FASTEsopePointerDeclarator` | `pointerDeclarators` | `FASTEsopePointerDeclarationStatement` | |
| `variableDeclarator` | `FASTEsopePointerDeclarator` | `pointerDeclarator` | `FASTFortranVariableDeclarator` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `pointedTypeName` | `String` | nil | |

"
Class {
	#name : 'FASTEsopePointerDeclarator',
	#superclass : 'FASTEsopeEntity',
	#instVars : [
		'#pointedTypeName => FMProperty',
		'#pointerDeclarationStatement => FMOne type: #FASTEsopePointerDeclarationStatement opposite: #pointerDeclarators'
	],
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopePointerDeclarator class >> annotation [

	<FMClass: #PointerDeclarator super: #FASTEsopeEntity>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> pointedTypeName [

	<FMProperty: #pointedTypeName type: #String>
	<generated>
	^ pointedTypeName
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> pointedTypeName: anObject [
	<generated>
	pointedTypeName := anObject
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> pointerDeclarationStatement [
	"Relation named: #pointerDeclarationStatement type: #FASTEsopePointerDeclarationStatement opposite: #pointerDeclarators"

	<generated>
	^ pointerDeclarationStatement
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> pointerDeclarationStatement: anObject [

	<generated>
	pointerDeclarationStatement := anObject
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> variableDeclarator [
	"Relation named: #variableDeclarator type: #FASTFortranVariableDeclarator opposite: #pointerDeclarator"

	<generated>
	<FMProperty: #variableDeclarator type: #FASTFortranVariableDeclarator opposite: #pointerDeclarator>
	^ self attributeAt: #variableDeclarator ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTEsopePointerDeclarator >> variableDeclarator: anObject [

	<generated>
	(self attributeAt: #variableDeclarator ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self variableDeclarator.
		self attributeAt: #variableDeclarator put: anObject.
		otherSide pointerDeclarator: nil ]
	ifNotNil: [ 
		self attributeAt: #variableDeclarator put: anObject.
		anObject pointerDeclarator: self ]
]
