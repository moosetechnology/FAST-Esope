Class {
	#name : 'FASTEsopeJsonVisitor',
	#superclass : 'FASTFortranJsonVisitor',
	#instVars : [
		'inSegmentDeclaration'
	],
	#category : 'FAST-Esope-Visitors-Importer',
	#package : 'FAST-Esope-Visitors',
	#tag : 'Importer'
}

{ #category : 'initialization' }
FASTEsopeJsonVisitor >> initialize [

	super initialize.

	model := FASTEsopeModel new.

	inSegmentDeclaration := false
]

{ #category : 'testing' }
FASTEsopeJsonVisitor >> isEsopeTransformation: aString [

	aString isString ifFalse: [ ^ false ].
	^ #( #d__ #s__ ) includes: aString
]

{ #category : 'helpers' }
FASTEsopeJsonVisitor >> processEsopeIfComment: anEsopeIfCommentNode [ 
	self shouldBeImplemented.
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> processEsopeNode: anEsopeCommandNode command: esopeCommandClass [

	| data variables |

	data := self processEsopeComment: anEsopeCommandNode.

	variables := (data allButFirst: 3) collect: [ :name | | varName |
		varName := name copyUpToSubstring: '*'.
		(self model newScalarVariable)
			name: varName;
			yourself
		].
	^(self newEntity: esopeCommandClass atPosition: data second)
		variables: variables ;
		yourself
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitComment: aCommentNode [
	"Separates comments that are genuine fortran comments and the one that contain Esope commands"
	| content |
	content := aCommentNode at: 'comment'.

	^(self isEsopeComment: content)
		ifTrue: [  self visitEsopeComment: aCommentNode ]
		ifFalse: [ super  visitComment: aCommentNode ]
	
]

{ #category : 'visiting statement' }
FASTEsopeJsonVisitor >> visitDeclarationStatement: aDeclarationStatementNode [

	| data |
	data := super visitDeclarationStatement: aDeclarationStatementNode.

	^inSegmentDeclaration 
		ifTrue: [
			segmentDeclarations last addStatement: data.
			nil
		]
		ifFalse: [ data ]
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeEndComment: anEsopeCommentNode [
	"delegate to a method with a more explicit name
		subclasses should override #visitEsopeEndSegmentComment: not this method"

	^self visitEsopeEndsegmentComment: anEsopeCommentNode 
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeEndsegmentComment: anEsopeCommentNode [

	inSegmentDeclaration := false.
	^nil

]

{ #category : 'visiting' }
FASTEsopeJsonVisitor >> visitEsopeIfComment: anEsopeIfCommentNode [ 
	^self processEsopeIfComment: anEsopeIfCommentNode
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeIncludeComment: anEsopeIncludeCommentNode [

	| data |
	data := self processEsopeComment: anEsopeIncludeCommentNode.
	
	^(self newEntity: FASTEsopeIncludeStatement atPosition: data second)
		filename: data fourth
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopePointeurComment: anEsopePointerNode [

	| data pointeur |
	data := self processEsopeComment: anEsopePointerNode.

	pointeur := self newEntity: FASTEsopePointerDeclarationStatement atPosition: data second.

	(data allButFirst: 3) 
		do: [ :each | | typeAndVarName |
			typeAndVarName := each splitOn: '.'.
			pointeur 
				addPointerDeclarator: (model newPointerDeclarator 
					pointedTypeName: typeAndVarName second ; 
					variableDeclarator: (model newVariableDeclarator name: typeAndVarName first);
					yourself
				)
		].

	^pointeur
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegactComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegact 

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegadjComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegadj 

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegcopComment: anEsopeCommentNode [

	^self shouldBeImplemented 

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegdesComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegdes

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSeginiComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegini 

]

{ #category : 'visiting' }
FASTEsopeJsonVisitor >> visitEsopeSegmentComment: anEsopeCommentNode [
	"Source anchor for the segment is wrong,
	 endLine/endColumn will be updated in #visitEsopeEndsegmentComment:"

	| data |
	data := self processEsopeComment: anEsopeCommentNode.

	inSegmentDeclaration := true.
	segmentDeclarations add: ((self newEntity: FASTEsopeSegment atPosition: data second)
		name: data fourth asLowercase ;
		yourself).
	
	^nil
	
]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegmovComment: anEsopeCommentNode [

	^self shouldBeImplemented 

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegprtComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegprt

]

{ #category : 'visiting esope' }
FASTEsopeJsonVisitor >> visitEsopeSegsupComment: anEsopeCommentNode [

	^self processEsopeNode: anEsopeCommentNode command: FASTEsopeSegsup 

]
