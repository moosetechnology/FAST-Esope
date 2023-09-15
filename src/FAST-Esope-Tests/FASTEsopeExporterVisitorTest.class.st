Class {
	#name : #FASTEsopeExporterVisitorTest,
	#superclass : #FASTFortranExporterVisitorTest,
	#category : #'FAST-Esope-Tests'
}

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
