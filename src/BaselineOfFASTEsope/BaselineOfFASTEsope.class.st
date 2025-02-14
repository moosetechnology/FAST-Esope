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
		self defineDependencies: spec.
		self definePackages: spec.
		self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfFASTEsope >> defineDependencies: spec [

	spec 
		baseline: 'FASTFortran'
		with: [
			spec
				loads: #( 'all' );
				repository: 'github://moosetechnology/FAST-Fortran' ]
]

{ #category : 'baselines' }
BaselineOfFASTEsope >> defineGroups: spec [

	spec
		group: 'default' with: #( core );
		group: 'core' with: #( 'FAST-Esope-Entities' 'FAST-Esope-Visitors' );
		group: 'all' with: #( 'core' 'FAST-Esope-Generator' 'FAST-Esope-Visitors-Tests' )
]

{ #category : 'baselines' }
BaselineOfFASTEsope >> definePackages: spec [

	spec
		package: 'FAST-Esope-Entities' with: [ spec requires: #(FASTFortran) ] ;
		package: 'FAST-Esope-Generator' with: [ spec requires: #(FASTFortran) ] ;
		package: 'FAST-Esope-Visitors' with: [ spec requires: #('FAST-Esope-Entities') ] ;
		package: 'FAST-Esope-Visitors-Tests' with: [ spec requires: #('FAST-Esope-Visitors') ]

]
