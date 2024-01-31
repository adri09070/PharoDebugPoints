Class {
	#name : 'ClyDebugWatchOnVariableReadWriteCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableReadWriteCommand class >> accessStrategy [

	^ #all
]

{ #category : 'testing' }
ClyDebugWatchOnVariableReadWriteCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyDebugWatchOnVariableReadWriteCommand >> defaultMenuItemName [

	^ 'Watch on access'
]
