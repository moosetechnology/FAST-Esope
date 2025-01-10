"
an abstract class to represent an esopeCommand, segini, segadj, segsup, segprt, segact, segdes, segcop, segmov

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FASTEsopeEsopeCommand` | `esopeCommand` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTEsopeEsopeCommand',
	#superclass : 'FASTFortranAbstractStatement',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeEsopeCommand class >> annotation [

	<FMClass: #EsopeCommand super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTEsopeEsopeCommand >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : 'accessing' }
FASTEsopeEsopeCommand >> variables [
	"Relation named: #variables type: #FASTFortranVariable opposite: #esopeCommand"

	<generated>
	<derived>
	<FMProperty: #variables type: #FASTFortranVariable opposite: #esopeCommand>
	^ self attributeAt: #variables ifAbsentPut: [ FMMultivalueLink on: self opposite: #esopeCommand: ]
]

{ #category : 'accessing' }
FASTEsopeEsopeCommand >> variables: anObject [

	<generated>
	self variables value: anObject
]
