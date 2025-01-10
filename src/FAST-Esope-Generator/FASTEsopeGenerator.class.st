Class {
	#name : 'FASTEsopeGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'esopeCommand',
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
		'type',
		'tDeclaredType',
		'variableDeclarationStatement',
		'pointeurDeclarationStatement',
		'variable',
		'binaryExpression',
		'arrayDimensionExpression'
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

	segment := self newClassNamed: #Segment comment: 'comment for segment'.

	esopeCommand := self newClassNamed: #EsopeCommand 
		comment: 'an abstract class to represent an esopeCommand, segini, segadj, segsup, segprt, segact, segdes, segcop, segmov'.
	
	segini := self newClassNamed: #Segini comment: 'segini p1, p2, ..., pN with N=1, 2, 3,...'.
	segadj := self newClassNamed: #Segadj comment: 'segadj p1, p2, ..., pN with N=1, 2, 3,...'.
	segsup := self newClassNamed: #Segsup comment: 'segsup p1, p2, ..., pN with N=1, 2, 3,...'.
	segprt := self newClassNamed: #Segprt comment: 'segprt p1, p2, ..., pN with N=1, 2, 3,...'.
	segact := self newClassNamed: #Segact comment: 'segact p1, p2, ..., pN with N=1, 2, 3,...'.
	segdes := self newClassNamed: #Segdes comment: 'segdes p1, p2, ..., pN with N=1, 2, 3,...'.
	segcop := self newClassNamed: #Segcop comment: 'segini p=q, which will first allocate memory space for p and copy the contents of q into p'.
	segmov := self newClassNamed: #Segmov comment: 'segact p=q, which copies the contents of q into p, without first allocating memory'.

	pointeurDeclarationStatement := self newClassNamed: #PointeurDeclarationStatement comment: 'pointeur p1.SEG, p2.OTHER_SEG, ..., pN.SEG with N=1, 2, 3,...'.

	abstractStatement := self remoteEntity: #AbstractStatement withPrefix: #FASTFortran.
	binaryExpression := self remoteEntity: #BinaryExpression withPrefix: #FASTFortran.
	type := self remoteEntity: #Type withPrefix: #FASTFortran.
	variable := self remoteEntity: #Variable withPrefix: #FASTFortran.
	variableDeclarationStatement := self remoteEntity: #VariableDeclarationStatement withPrefix: #FASTFortran.

]

{ #category : 'definition' }
FASTEsopeGenerator >> defineHierarchy [

	arrayDimensionExpression --|> binaryExpression.

	segment --|> #TType.
	segment --|> #TStatementBlock.
	segment --|> tDeclaration.
	segment --|> abstractStatement.

	esopeCommand --|> abstractStatement.

	segini --|> esopeCommand.
	segadj --|> esopeCommand.
	segsup --|> esopeCommand.
	segprt --|> esopeCommand.
	segact --|> esopeCommand.
	segdes --|> esopeCommand.
	segcop --|> esopeCommand.
	segmov --|> esopeCommand.
	
	pointeurDeclarationStatement --|> abstractStatement.
	pointeurDeclarationStatement --|> tDeclaration.

]

{ #category : 'definition' }
FASTEsopeGenerator >> defineRelations [ 
	super defineRelations.

	esopeCommand -* variable.
	
	pointeurDeclarationStatement -* variableDeclarationStatement.
]

{ #category : 'definition' }
FASTEsopeGenerator >> defineTraits [

	super defineTraits.

	tDeclaration := self remoteTrait: #TDeclaration withPrefix: #FASTFortran.
	tDeclaredType := self remoteTrait: #TDeclaredType withPrefix: #FASTFortran.
]
