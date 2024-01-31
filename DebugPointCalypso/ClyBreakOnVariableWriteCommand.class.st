Class {
	#name : 'ClyBreakOnVariableWriteCommand',
	#superclass : 'ClyDebugBreakOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyBreakOnVariableWriteCommand class >> accessStrategy [

	^ #write
]

{ #category : 'testing' }
ClyBreakOnVariableWriteCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyBreakOnVariableWriteCommand >> defaultMenuItemName [

	^ 'Break on write'
]
