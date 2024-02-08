Class {
	#name : 'StBreakOnWriteCommand',
	#superclass : 'StDebugPointSlotTargetCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'default' }
StBreakOnWriteCommand class >> defaultDescription [

	^ 'Breaks when the selected or any variable is written'
]

{ #category : 'default' }
StBreakOnWriteCommand class >> defaultIconName [

	^ #smallObjects
]

{ #category : 'default' }
StBreakOnWriteCommand class >> defaultName [ 

	^ 'Break on write'
]

{ #category : 'executing' }
StBreakOnWriteCommand >> execute [

	^ context breakInspectedObjectOnWrite
]
