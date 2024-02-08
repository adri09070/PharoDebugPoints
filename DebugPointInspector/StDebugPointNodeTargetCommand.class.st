Class {
	#name : 'StDebugPointNodeTargetCommand',
	#superclass : 'StDebugPointCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'testing' }
StDebugPointNodeTargetCommand >> canBeExecuted [

	^ self appliesTo: context
]
