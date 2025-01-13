"
I represent a segment type in a pointeur declaration. Ex: SEG in `Pointeur p.SEG`

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|
| `typedEntities` | `FamixTType` | `declaredType` | `FamixTTypedEntity` | Entities that have this type as declaredType|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FASTEsopePointedType',
	#superclass : 'FASTFortranType',
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopePointedType class >> annotation [

	<FMClass: #PointedType super: #FASTFortranType>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]
