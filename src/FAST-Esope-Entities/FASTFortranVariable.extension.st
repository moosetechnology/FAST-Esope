Extension { #name : 'FASTFortranVariable' }

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> segCommand [
	"Relation named: #segCommand type: #FASTEsopeSegCommand opposite: #variables"

	<generated>
	<FMProperty: #segCommand type: #FASTEsopeSegCommand opposite: #variables>
	<package: #'FAST-Esope-Entities'>
	^ self attributeAt: #segCommand ifAbsent: [ nil ]
]

{ #category : '*FAST-Esope-Entities-accessing' }
FASTFortranVariable >> segCommand: anObject [

	<generated>
	self attributeAt: #segCommand put: (FMMultivalueLink on: self update: #variables from: self segCommand to: anObject).
]
