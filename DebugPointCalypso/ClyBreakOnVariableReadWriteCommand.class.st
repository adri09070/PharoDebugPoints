Class {
	#name : 'ClyBreakOnVariableReadWriteCommand',
	#superclass : 'ClyDebugBreakOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyBreakOnVariableReadWriteCommand class >> accessStrategy [

	^ #all
]

{ #category : 'testing' }
ClyBreakOnVariableReadWriteCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyBreakOnVariableReadWriteCommand >> defaultMenuItemName [

	^ 'Break on access'
]
