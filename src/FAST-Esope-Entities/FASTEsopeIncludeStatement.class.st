"
Represents a '%inc' instruction in an Esope file

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `filename` | `String` | nil | name of the file included|

"
Class {
	#name : 'FASTEsopeIncludeStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#instVars : [
		'#filename => FMProperty'
	],
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeIncludeStatement class >> annotation [

	<FMClass: #IncludeStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTEsopeIncludeStatement >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'name of the file included'>
	^ filename
]

{ #category : 'accessing' }
FASTEsopeIncludeStatement >> filename: anObject [
	<generated>
	filename := anObject
]
