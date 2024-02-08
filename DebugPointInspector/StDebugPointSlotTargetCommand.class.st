Class {
	#name : 'StDebugPointSlotTargetCommand',
	#superclass : 'StDebugPointCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'testing' }
StDebugPointSlotTargetCommand >> canBeExecuted [

	^ context enableSlotMenuEntries
]
