"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTEsopeEntity',
	#superclass : 'MooseEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'FAST-Esope-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FASTEsopeEntity class >> isAbstract [

	<generated>
	^ self == FASTEsopeEntity
]

{ #category : 'meta' }
FASTEsopeEntity class >> metamodel [

	<generated>
	^ FASTEsopeModel metamodel
]

{ #category : 'testing' }
FASTEsopeEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTEsopeEntity >> isStatement [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTEsopeEntity >> isStatementBlock [

	<generated>
	^ false
]

{ #category : 'testing' }
FASTEsopeEntity >> isType [

	<generated>
	^ false
]
