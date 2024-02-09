Class {
	#name : 'BaselineOfPharoDebugPoints',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPharoDebugPoints',
	#package : 'BaselineOfPharoDebugPoints'
}

{ #category : 'baselines' }
BaselineOfPharoDebugPoints >> baseline: spec [

	<baseline>
	spec for: #common do: [
		self newtools: spec.
		self seaside: spec.

		spec package: 'DebugPointFramework'.
		spec
			package: 'DebugPointCalypso'
			with: [ spec requires: #( 'DebugPointFramework'
			   'DebugPointUI' ) ].
		spec
			package: 'DebugPointUI'
			with: [ spec requires: #( 'DebugPointFramework' ) ].

		spec
			package: 'DebugPointFramework-Tests'
			with: [ spec requires: #( 'DebugPointFramework' ) ].

		spec package: 'DebugPointInspector' with: [
			spec requires: #( 'DebugPointUI' 'DebugPointFramework'
			   'NewTools' ) ].
		spec
			package: 'DebugPointSeaside'
			with: [
				spec requires:
					#( 'DebugPointFramework' 'DebugPointUI' 'Seaside3' ) ].

		"Groups"
		spec
			group: 'Core' with: #( 'DebugPointFramework' );
			group: 'Tests' with: #( 'Core' 'DebugPointFramework-Tests' );
			group: 'UI' with: #( 'Core' 'DebugPointUI' );
			group: 'Seaside' with: #( 'UI' 'DebugPointSeaside' );
			group: 'BrowserIntegration' with: #( 'DebugPointCalypso' );
			group: 'InspectorIntegration' with: #( 'DebugPointInspector' );
			group: 'default'
			with: #( 'Tests' 'UI' 'BrowserIntegration' 'InspectorIntegration' ) ]
]

{ #category : 'baselines' }
BaselineOfPharoDebugPoints >> newtools: spec [

	spec
		baseline: 'NewTools'
		with: [ spec repository: 'github://pharo-spec/NewTools:Pharo12' ]
]

{ #category : 'baselines' }
BaselineOfPharoDebugPoints >> seaside: spec [

	spec
		baseline: 'Seaside3'
		with: [ spec repository: 'github://SeasideSt/Seaside:master' ]
]
