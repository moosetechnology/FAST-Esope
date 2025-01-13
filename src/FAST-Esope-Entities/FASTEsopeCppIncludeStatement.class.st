"
Represents a #include instruction in an E or F file

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `filename` | `String` | nil | name of the file included|

"
Class {
	#name : 'FASTEsopeCppIncludeStatement',
	#superclass : 'FASTFortranAbstractStatement',
	#instVars : [
		'#filename => FMProperty'
	],
	#category : 'FAST-Esope-Entities-Entities',
	#package : 'FAST-Esope-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTEsopeCppIncludeStatement class >> annotation [

	<FMClass: #CppIncludeStatement super: #FASTFortranAbstractStatement>
	<package: #'FAST-Esope-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FASTEsopeCppIncludeStatement >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'name of the file included'>
	^ filename
]

{ #category : 'accessing' }
FASTEsopeCppIncludeStatement >> filename: anObject [
	<generated>
	filename := anObject
]
