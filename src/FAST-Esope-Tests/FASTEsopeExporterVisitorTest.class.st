Class {
	#name : #FASTEsopeExporterVisitorTest,
	#superclass : #FASTFortranExporterVisitorTest,
	#category : #'FAST-Esope-Tests'
}

{ #category : #'entity creation' }
FASTEsopeExporterVisitorTest >> esopeSegment: segmentName members: aCollection [

	^FASTEsopeSegment new
		name: segmentName ;
		members: aCollection ;
		startPos: 1 ;
		endPos: (14 + segmentName size) ;
		yourself
]

{ #category : #'entity creation' }
FASTEsopeExporterVisitorTest >> include: filename [

	^FASTEsopeInclude new
		filename: filename ;
		startPos: 1 ;
		endPos: (11+ filename size) ;
		yourself
]

{ #category : #'entity creation' }
FASTEsopeExporterVisitorTest >> pointerDeclarationStatement: segmentName variable: variableName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTEsopePointerDeclaration new
		type: (self pointerType: segmentName) ;
		declarators: { self scalarVariable: variableName }  ;
		startPos: 1 ;
		endPos: (9 + segmentName size + variableName size) ;
		yourself
]

{ #category : #'entity creation' }
FASTEsopeExporterVisitorTest >> pointerStatement: esopeCommand variable: variableName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTEsopePointerStatement new
		command: esopeCommand ;
		pointerVariable: variableName  ;
		startPos: 1 ;
		endPos: (7 + variableName size) ;
		yourself
]

{ #category : #'entity creation' }
FASTEsopeExporterVisitorTest >> pointerType: segmentName [

	^FASTEsopePointerType new
		name: segmentName ;
		yourself
]

{ #category : #running }
FASTEsopeExporterVisitorTest >> setUp [
	super setUp.

	visitor := FASTEsopeExporterVisitor new
]

{ #category : #tests }
FASTEsopeExporterVisitorTest >> testInclude [
	| stmt |
	stmt := self include: 'somefile.inc'.

	self
		assertExport: stmt
		equals: '#include "somefile.inc"
'
]

{ #category : #tests }
FASTEsopeExporterVisitorTest >> testPointerDeclaration [
	| stmt |
	stmt := self pointerDeclarationStatement: 'pstr' variable: 'pt'.

	self
		assertExport: stmt
		equals: '      pointeur pt.pstr
'
]

{ #category : #tests }
FASTEsopeExporterVisitorTest >> testPointerStatement [
	| stmt |
	stmt := self pointerStatement: 'segini' variable: 'pt'.

	self
		assertExport: stmt
		equals: '      segini,pt
'
]

{ #category : #tests }
FASTEsopeExporterVisitorTest >> testSegmentEmpty [
	| stmt |
	stmt := self esopeSegment: 'pstr' members: #().

	self
		assertExport: stmt
		equals: '      segment,pstr
      end segment
'
]

{ #category : #tests }
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
