Class {
	#name : 'FASTEsopeExporterVisitorTest',
	#superclass : 'FASTFortranExporterVisitorTest',
	#category : 'FAST-Esope-Tests',
	#package : 'FAST-Esope-Tests'
}

{ #category : 'entity creation' }
FASTEsopeExporterVisitorTest >> esopeCommandStatement: esopeCommandClass variable: variableName [
	"end position is approximate, test should adjust if a real value is needed"

	^esopeCommandClass new
		variables: { self scalarVariable: variableName } ;
		startPos: 1 ;
		endPos: (7 + variableName size) ;
		yourself
]

{ #category : 'entity creation' }
FASTEsopeExporterVisitorTest >> esopeSegment: segmentName members: aCollection [

	^FASTEsopeSegment new
		name: segmentName ;
		statements: aCollection ;
		startPos: 1 ;
		endPos: (14 + segmentName size) ;
		yourself
]

{ #category : 'entity creation' }
FASTEsopeExporterVisitorTest >> include: filename [

	^FASTEsopeCppIncludeStatement new
		filename: filename ;
		startPos: 1 ;
		endPos: (11+ filename size) ;
		yourself
]

{ #category : 'entity creation' }
FASTEsopeExporterVisitorTest >> pointerDeclarationStatement: segmentName variable: variableName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTEsopePointeurDeclarationStatement new
		addVariableDeclarationStatement: (
			FASTFortranVariableDeclarationStatement new
				declaredType: (self pointerType: segmentName) ;
				declarators: { self variableDeclarator: variableName }
				yourself
		) ;
		startPos: 1 ;
		endPos: (9 + segmentName size + variableName size) ;
		yourself
]

{ #category : 'entity creation' }
FASTEsopeExporterVisitorTest >> pointerType: segmentName [

	^FASTEsopePointerType new
		name: segmentName ;
		yourself
]

{ #category : 'running' }
FASTEsopeExporterVisitorTest >> setUp [
	super setUp.

	visitor := FASTEsopeExporterVisitor new
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testInclude [
	| stmt |
	stmt := self include: 'somefile.inc'.

	self
		assertExport: stmt
		equals: '#include "somefile.inc"
'
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testIncludeStatement [
	| stmt |
	stmt := self include: 'somefile.inc'.

	self
		assertExport: stmt
		equals: '#include "somefile.inc"
'
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testPointerDeclaration [
	| stmt |
	stmt := self pointerDeclarationStatement: 'pstr' variable: 'pt'.

	self
		assertExport: stmt
		equals: '      pointeur pt.pstr
'
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testSeginiStatement [
	| stmt |
	stmt := self esopeCommandStatement: FASTEsopeSegini variable: 'pt'.

	self
		assertExport: stmt
		equals: '      segini,pt
'
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testSegmentEmpty [
	| stmt |
	stmt := self esopeSegment: 'pstr' members: #().

	self
		assertExport: stmt
		equals: '      segment,pstr
      end segment
'
]

{ #category : 'tests' }
FASTEsopeExporterVisitorTest >> testSegmentWithMembers [
	| stmt |
	stmt := self
		esopeSegment: 'pstr'
		members: {
			self declarationStatement: (self integerType: nil) variables: #(i j) .
			self declarationStatement: (self characterType: nil) variables: #(name)
		}.

	self
		assertExport: stmt
		equals: '      segment,pstr
      integer i,j
      character name
      end segment
'
]
