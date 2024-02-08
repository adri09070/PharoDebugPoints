Class {
	#name : 'StWatchOnWriteCommand',
	#superclass : 'StDebugPointSlotTargetCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'default' }
StWatchOnWriteCommand class >> defaultDescription [

	^ 'Saves values written for the selected or any variable'
]

{ #category : 'initialization' }
StWatchOnWriteCommand class >> defaultIconName [

	^ #smallObjects
]

{ #category : 'default' }
StWatchOnWriteCommand class >> defaultName [ 

	^ 'Watch write'
]

{ #category : 'executing' }
StWatchOnWriteCommand >> execute [

	^ context watchInspectedObjectWrite
]
