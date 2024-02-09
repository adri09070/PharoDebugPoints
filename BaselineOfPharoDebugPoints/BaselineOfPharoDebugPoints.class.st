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
		spec
			baseline: 'NewTools'
			with: [ spec repository: 'github://pharo-spec/NewTools:Pharo12' ].

		spec
			baseline: 'Seaside'
			with: [ spec repository: 'github://SeasideSt/Seaside:master' ].

		spec
			package: 'DebugPointFramework'
			with: [ spec requires: #( 'Seaside' ) ].
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
			   'NewTools' ) ] ]
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
