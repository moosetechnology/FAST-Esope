Extension { #name : 'FASTFortranVariable' }

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> attributeInParentDeref [
	"Relation named: #attributeInParentDeref type: #FASTEsopeAttributeDerefVariable opposite: #attribute"

	<generated>
	<derived>
	<FMProperty: #attributeInParentDeref type: #FASTEsopeAttributeDerefVariable opposite: #attribute>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #attributeInParentDeref ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> attributeInParentDeref: anObject [

	<generated>
	(self attributeAt: #attributeInParentDeref ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self attributeInParentDeref.
		self attributeAt: #attributeInParentDeref put: anObject.
		otherSide attribute: nil ]
	ifNotNil: [ 
		self attributeAt: #attributeInParentDeref put: anObject.
		anObject attribute: self ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> esopeCommand [
	"Relation named: #esopeCommand type: #FASTEsopeEsopeCommand opposite: #variables"

	<generated>
	<FMProperty: #esopeCommand type: #FASTEsopeEsopeCommand opposite: #variables>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #esopeCommand ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> esopeCommand: anObject [

	<generated>
	self attributeAt: #esopeCommand put: (FMMultivalueLink on: self update: #variables from: self esopeCommand to: anObject).
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> pointerInParentDeref [
	"Relation named: #pointerInParentDeref type: #FASTEsopeAttributeDerefVariable opposite: #pointer"

	<generated>
	<derived>
	<FMProperty: #pointerInParentDeref type: #FASTEsopeAttributeDerefVariable opposite: #pointer>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #pointerInParentDeref ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> pointerInParentDeref: anObject [

	<generated>
	(self attributeAt: #pointerInParentDeref ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self pointerInParentDeref.
		self attributeAt: #pointerInParentDeref put: anObject.
		otherSide pointer: nil ]
	ifNotNil: [ 
		self attributeAt: #pointerInParentDeref put: anObject.
		anObject pointer: self ]
]
