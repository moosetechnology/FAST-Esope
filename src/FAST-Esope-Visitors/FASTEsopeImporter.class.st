Class {
	#name : 'FASTEsopeImporter',
	#superclass : 'FASTFortranImporter',
	#category : 'FAST-Esope-Visitors-Importer',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Importer'
}

{ #category : 'api' }
FASTEsopeImporter class >> onFile: aPathString [

	^super onSourceString: (PPEsopeRewriter onFile: aPathString)
]

{ #category : 'api' }
FASTEsopeImporter class >> onSourceString: aSourceString [

	^super onSourceString: (PPEsopeRewriter onSourceString: aSourceString)
]

{ #category : 'running' }
FASTEsopeImporter >> jsonVisitor [

	^FASTEsopeJsonVisitor new
]
