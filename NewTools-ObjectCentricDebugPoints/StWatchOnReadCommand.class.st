Class {
	#name : 'StWatchOnReadCommand',
	#superclass : 'StDebugPointSlotTargetCommand',
	#category : 'NewTools-ObjectCentricDebugPoints',
	#package : 'NewTools-ObjectCentricDebugPoints'
}

{ #category : 'default' }
StWatchOnReadCommand class >> defaultDescription [

	^ 'Saves values read for the selected or any variable'
]

{ #category : 'default' }
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
