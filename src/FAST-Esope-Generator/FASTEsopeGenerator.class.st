Class {
	#name : 'FASTEsopeGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'segini',
		'segadj',
		'segsup',
		'segprt',
		'segact',
		'segdes',
		'segcop',
		'segmov',
		'abstractStatement',
		'segment',
		'tDeclaration',
		'variable',
		'binaryExpression',
		'arrayDimensionExpression',
		'cppIncludeStatement',
		'pointerDeclarationStatement',
		'pointerDeclarator',
		'variableDeclarator',
		'segCommand'
	],
	#category : 'FAST-Esope-Generator',
	#package : 'FAST-Esope-Generator'
}

{ #category : 'accessing' }
FASTEsopeGenerator class >> packageName [

	<ignoreForCoverage>
	^#'FAST-Esope-Entities'
]

{ #category : 'accessing' }
FASTEsopeGenerator class >> prefix [

	^ #FASTEsope
]

{ #category : 'accessing' }
FASTEsopeGenerator class >> submetamodels [

	^ { FASTFortranGenerator }
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineClasses [

	super defineClasses.

	arrayDimensionExpression := self newClassNamed: #ArrayDimensionExpression comment: 'I represent a slash operator ptr.attr(/1)'.
	
	"already exists in FASTFortran as FASTFortranFieldAccess
	attributeDerefVariable := self newClassNamed: #AttributeDerefVariable comment: 'I represent an attribute in  ptr.attr'."
	
	cppIncludeStatement := builder newClassNamed: #CppIncludeStatement comment: 'Represents a #include instruction in an E or F file'.

	segment := self newClassNamed: #Segment comment: 'comment for segment'.

	segCommand := self newClassNamed: #SegCommand 
		comment: 'an abstract class to represent an esopeCommand: segini, segadj, segsup, segprt, segact, segdes, segcop, segmov'.
	
	segini := self newClassNamed: #Segini comment: 'segini p1, p2, ..., pN with N=1, 2, 3,...'.
	segadj := self newClassNamed: #Segadj comment: 'segadj p1, p2, ..., pN with N=1, 2, 3,...'.
	segsup := self newClassNamed: #Segsup comment: 'segsup p1, p2, ..., pN with N=1, 2, 3,...'.
	segprt := self newClassNamed: #Segprt comment: 'segprt p1, p2, ..., pN with N=1, 2, 3,...'.
	segact := self newClassNamed: #Segact comment: 'segact p1, p2, ..., pN with N=1, 2, 3,...'.
	segdes := self newClassNamed: #Segdes comment: 'segdes p1, p2, ..., pN with N=1, 2, 3,...'.
	segcop := self newClassNamed: #Segcop comment: 'segini p=q, which will first allocate memory space for p and copy the contents of q into p'.
	segmov := self newClassNamed: #Segmov comment: 'segact p=q, which copies the contents of q into p, without first allocating memory'.

	pointerDeclarationStatement := self newClassNamed: #PointerDeclarationStatement comment: 'pointeur p1.SEG, p2.OTHER_SEG, ..., pN.SEG with N=1, 2, 3,...'.
	pointerDeclarator := self newClassNamed: #PointerDeclarator comment: 'A declarator for one "pointeur" and its segment type in a PointerDeclarationStatement'.

	abstractStatement := self remoteEntity: #AbstractStatement withPrefix: #FASTFortran.
	binaryExpression := self remoteEntity: #BinaryExpression withPrefix: #FASTFortran.
	variable := self remoteEntity: #Variable withPrefix: #FASTFortran.
	variableDeclarator  := self remoteEntity: #VariableDeclarator withPrefix: #FASTFortran.
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineHierarchy [

	arrayDimensionExpression --|> binaryExpression.

	segment --|> #TType.
	segment --|> #TStatementBlock.
	segment --|> tDeclaration.
	segment --|> abstractStatement.
	
	cppIncludeStatement --|> abstractStatement.

	segCommand --|> abstractStatement.

	segini --|> segCommand.
	segadj --|> segCommand.
	segsup --|> segCommand.
	segprt --|> segCommand.
	segact --|> segCommand.
	segdes --|> segCommand.
	segcop --|> segCommand.
	segmov --|> segCommand.
	
	pointerDeclarationStatement --|> abstractStatement.
	pointerDeclarationStatement --|> tDeclaration.

]

{ #category : 'definition' }
FASTEsopeGenerator >> defineProperties [ 

	super defineProperties.

	(cppIncludeStatement property: #filename type: #String)
		comment: 'name of the file included'.

	pointerDeclarator property: #pointedTypeName type: #String.
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineRelations [ 
	super defineRelations.

	segCommand -* variable.
	
	pointerDeclarationStatement -* pointerDeclarator.
	pointerDeclarator - variableDeclarator 
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineTraits [

	super defineTraits.

	tDeclaration := self remoteTrait: #TDeclaration withPrefix: #FASTFortran.
]
