"
I represent an attribute in  ptr.attr

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attribute` | `FASTEsopeAttributeDerefVariable` | `attributeInParentDeref` | `FASTFortranVariable` | |
| `pointer` | `FASTEsopeAttributeDerefVariable` | `pointerInParentDeref` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTEsopeAttributeDerefVariable',
	#superclass : 'FASTFortranVariable',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeAttributeDerefVariable class >> annotation [

	<FMClass: #AttributeDerefVariable super: #FASTFortranVariable>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTEsopeAttributeDerefVariable >> attribute [
	"Relation named: #attribute type: #FASTFortranVariable opposite: #attributeInParentDeref"

	<generated>
	<FMProperty: #attribute type: #FASTFortranVariable opposite: #attributeInParentDeref>
	^ self attributeAt: #attribute ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTEsopeAttributeDerefVariable >> attribute: anObject [

	<generated>
	(self attributeAt: #attribute ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self attribute.
		self attributeAt: #attribute put: anObject.
		otherSide attributeInParentDeref: nil ]
	ifNotNil: [ 
		self attributeAt: #attribute put: anObject.
		anObject attributeInParentDeref: self ]
]

{ #category : 'accessing' }
FASTEsopeAttributeDerefVariable >> pointer [
	"Relation named: #pointer type: #FASTFortranVariable opposite: #pointerInParentDeref"

	<generated>
	<FMProperty: #pointer type: #FASTFortranVariable opposite: #pointerInParentDeref>
	^ self attributeAt: #pointer ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTEsopeAttributeDerefVariable >> pointer: anObject [

	<generated>
	(self attributeAt: #pointer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self pointer.
		self attributeAt: #pointer put: anObject.
		otherSide pointerInParentDeref: nil ]
	ifNotNil: [ 
		self attributeAt: #pointer put: anObject.
		anObject pointerInParentDeref: self ]
]
