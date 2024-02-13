Class {
	#name : 'StBreakOnReadCommand',
	#superclass : 'StDebugPointSlotTargetCommand',
	#category : 'NewTools-ObjectCentricDebugPoints',
	#package : 'NewTools-ObjectCentricDebugPoints'
}

{ #category : 'default' }
StBreakOnReadCommand class >> defaultDescription [

	^ 'Breaks when the selected or any variable is read'
]

{ #category : 'default' }
StBreakOnReadCommand class >> defaultIconName [

	^ #smallObjects
]

{ #category : 'default' }
StBreakOnReadCommand class >> defaultName [ 

	^ 'Break on read'
]

{ #category : 'executing' }
StBreakOnReadCommand >> execute [

	^ context breakInspectedObjectOnRead
]