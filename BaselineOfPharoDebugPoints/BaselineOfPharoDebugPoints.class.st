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

		spec package: 'DebugPoints'.
		spec
			package: 'Calypso-SystemPlugins-DebugPoints-Browser'
			with: [ spec requires: #( 'DebugPoints'
			   'NewTools-DebugPointsBrowser' ) ].
		spec
			package: 'NewTools-DebugPointsBrowser'
			with: [ spec requires: #( 'DebugPoints' ) ].

		spec
			package: 'DebugPoints-Tests'
			with: [ spec requires: #( 'DebugPoints' ) ].

		spec package: 'NewTools-ObjectCentricDebugPoints' with: [
			spec requires: #( 'NewTools-DebugPointsBrowser' 'DebugPoints'
			   'NewTools' ) ].
		spec
			package: 'Seaside-DebugPoints'
			with: [
				spec requires:
					#( 'DebugPoints' 'NewTools-DebugPointsBrowser' 'Seaside3' ) ].

		"Groups"
		spec
			group: 'Core' with: #( 'DebugPoints' );
			group: 'Tests' with: #( 'Core' 'DebugPoints-Tests' );
			group: 'UI' with: #( 'Core' 'NewTools-DebugPointsBrowser' );
			group: 'Seaside' with: #( 'UI' 'Seaside-DebugPoints' );
			group: 'BrowserIntegration' with: #( 'Calypso-SystemPlugins-DebugPoints-Browser' );
			group: 'InspectorIntegration' with: #( 'NewTools-ObjectCentricDebugPoints' );
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
