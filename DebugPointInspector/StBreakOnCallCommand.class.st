Class {
	#name : 'StBreakOnCallCommand',
	#superclass : 'StDebugPointNodeTargetCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'default' }
StBreakOnCallCommand class >> defaultDescription [

	^ 'Halts when this method is called'
]

{ #category : 'default' }
StBreakOnCallCommand class >> defaultIconName [

	^ #smallDebug
]

{ #category : 'default' }
StBreakOnCallCommand class >> defaultName [ 

	^ 'Break on call'
]

{ #category : 'executing' }
StBreakOnCallCommand >> execute [

	^ context breakOnCallToSelectedMethod
]
