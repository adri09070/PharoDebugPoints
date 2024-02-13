Class {
	#name : 'StDebugPointNodeTargetCommand',
	#superclass : 'StDebugPointCommand',
	#category : 'NewTools-ObjectCentricDebugPoints',
	#package : 'NewTools-ObjectCentricDebugPoints'
}

{ #category : 'testing' }
StDebugPointNodeTargetCommand >> canBeExecuted [

	^ self appliesTo: context
]
