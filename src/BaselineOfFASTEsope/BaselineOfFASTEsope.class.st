Class {
	#name : 'BaselineOfFASTEsope',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFASTEsope',
	#package : 'BaselineOfFASTEsope'
}

{ #category : 'baselines' }
BaselineOfFASTEsope >> baseline: spec [

	<baseline>
	spec for: #common do: [
		spec description: 'Developement version of FAST Esope'.
		self definePackages: spec.
		self defineDependencies: spec ]
]

{ #category : 'baselines' }
BaselineOfFASTEsope >> defineDependencies: spec [

	spec baseline: 'FASTFortran' with: [
		spec
			loads: #( 'default' );
			repository: 'github://moosetechnology/FAST-Fortran' ]
]

{ #category : 'baselines' }
BaselineOfFASTEsope >> definePackages: spec [

	spec
		package: 'FAST-Esope-Entities' with: [ spec requires: #(FASTFortran) ] ;
		package: 'FAST-Esope-Generator' with: [ spec requires: #(FASTFortran) ] ;
		package: 'FAST-Esope-Visitors' with: [ spec requires: #('FAST-Esope-Entities') ] ;
		package: 'FAST-Esope-Visitors-Tests' with: [ spec requires: #('FAST-Esope-Visitors') ]

]
