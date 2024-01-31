Class {
	#name : 'ClyDebugWatchOnVariableWriteCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableWriteCommand class >> accessStrategy [

	^ #write
]

{ #category : 'testing' }
ClyDebugWatchOnVariableWriteCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyDebugWatchOnVariableWriteCommand >> defaultMenuItemName [

	^ 'Watch on write'
]
