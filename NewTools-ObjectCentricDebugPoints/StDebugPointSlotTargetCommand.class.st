Class {
	#name : 'StDebugPointSlotTargetCommand',
	#superclass : 'StDebugPointCommand',
	#category : 'NewTools-ObjectCentricDebugPoints',
	#package : 'NewTools-ObjectCentricDebugPoints'
}

{ #category : 'testing' }
StDebugPointSlotTargetCommand >> canBeExecuted [

	^ context enableSlotMenuEntries
]
