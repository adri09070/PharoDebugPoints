Class {
	#name : 'StDebugPointCommand',
	#superclass : 'CmCommand',
	#category : 'DebugPointInspector',
	#package : 'DebugPointInspector'
}

{ #category : 'testing' }
StDebugPointCommand >> appliesTo: aTool [
	^ [ aTool owner class ~= StDebuggerRawObjectInspector ]
		on: Error
		do: [ false ]
]

{ #category : 'testing' }
StDebugPointCommand >> asSpecCommand [

	| command |
	command := super asSpecCommand.
	self class defaultIconName ifNotNil: [ :iconName |
		command iconName: iconName ].

	^ command
]

{ #category : 'testing' }
StDebugPointCommand >> canBeExecuted [

	^ true
]
