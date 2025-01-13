Extension { #name : 'FASTFortranVariable' }

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
