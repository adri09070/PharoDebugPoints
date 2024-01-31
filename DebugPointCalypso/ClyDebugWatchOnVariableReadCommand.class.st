Class {
	#name : 'ClyDebugWatchOnVariableReadCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableReadCommand class >> accessStrategy [

	^ #read
]

{ #category : 'testing' }
ClyDebugWatchOnVariableReadCommand class >> isAbstract [

	^ false
]

{ #category : 'accessing' }
ClyDebugWatchOnVariableReadCommand >> defaultMenuItemName [

	^ 'Watch on read'
]
