Class {
	#name : 'ClyBreakOnVariableReadCommand',
	#superclass : 'ClyDebugBreakOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyBreakOnVariableReadCommand class >> accessStrategy [

	^ #read
]

{ #category : 'testing' }
ClyBreakOnVariableReadCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyBreakOnVariableReadCommand >> defaultMenuItemName [

	^ 'Break on read'
]
