Class {
	#name : #FASTEsopeExporterVisitorTest,
	#superclass : #FASTFortranExporterVisitorTest,
	#category : #'FAST-Esope-Tests'
}

{ #category : #'as yet unclassified' }
FASTEsopeExporterVisitorTest >> pointerDeclarationStatement: segmentName variable: variableName [
	"end position is approximate, test should adjust if a real value is needed"

	^FASTEsopePointerDeclaration new
		type: (self pointerType: segmentName) ;
		declarators: { self scalarVariable: variableName }  ;
		startPos: 1 ;
		endPos: (9 + segmentName size + variableName size) ;
		yourself
]

{ #category : #'as yet unclassified' }
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
