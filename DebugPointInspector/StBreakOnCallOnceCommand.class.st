Class {
	#name : 'StBreakOnCallOnceCommand',
	#superclass : 'StDebugPointNodeTargetCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'initialization' }
StBreakOnCallOnceCommand class >> defaultDescription [

	^ 'Breaks once when this method is called'
]

{ #category : 'initialization' }
StBreakOnCallOnceCommand class >> defaultIconName [

	^ #smallDebug
]

{ #category : 'initialization' }
StBreakOnCallOnceCommand class >> defaultName [ 

	^ 'Break once on call'
]

{ #category : 'executing' }
StBreakOnCallOnceCommand >> execute [

	^ context breakOnceOnCallToSelectedMethod
]
