"
an abstract class to represent an esopeCommand: segini, segadj, segsup, segprt, segact, segdes, segcop, segmov

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FASTEsopeSegCommand` | `segCommand` | `FASTFortranVariable` | |



"
Class {
	#name : 'FASTEsopeSegCommand',
	#superclass : 'FASTFortranAbstractStatement',
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeSegCommand class >> annotation [

	<FMClass: #SegCommand super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FASTEsopeSegCommand >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : 'accessing' }
FASTEsopeSegCommand >> variables [
	"Relation named: #variables type: #FASTFortranVariable opposite: #segCommand"

	<generated>
	<derived>
	<FMProperty: #variables type: #FASTFortranVariable opposite: #segCommand>
	^ self attributeAt: #variables ifAbsentPut: [ FMMultivalueLink on: self opposite: #segCommand: ]
]

{ #category : 'accessing' }
FASTEsopeSegCommand >> variables: anObject [

	<generated>
	self variables value: anObject
]
