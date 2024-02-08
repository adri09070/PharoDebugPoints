Class {
	#name : 'StWatchOnReadCommand',
	#superclass : 'StDebugPointSlotTargetCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'default' }
StWatchOnReadCommand class >> defaultDescription [

	^ 'Saves values read for the selected or any variable'
]

{ #category : 'initialization' }
StWatchOnReadCommand class >> defaultIconName [

	^ #smallObjects
]

{ #category : 'default' }
StWatchOnReadCommand class >> defaultName [ 

	^ 'Watch read'
]

{ #category : 'executing' }
StWatchOnReadCommand >> execute [

	^ context watchInspectedObjectRead
]
