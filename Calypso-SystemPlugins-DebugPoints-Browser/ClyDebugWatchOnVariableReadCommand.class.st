Class {
	#name : 'ClyDebugWatchOnVariableReadCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
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
