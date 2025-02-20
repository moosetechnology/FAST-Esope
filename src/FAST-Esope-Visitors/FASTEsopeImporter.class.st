Class {
	#name : 'FASTEsopeImporter',
	#superclass : 'FASTFortranImporter',
	#category : 'FAST-Esope-Visitors-Importer',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Importer'
}

{ #category : 'running' }
FASTEsopeImporter >> jsonVisitor [

	^FASTEsopeJsonVisitor new
]
