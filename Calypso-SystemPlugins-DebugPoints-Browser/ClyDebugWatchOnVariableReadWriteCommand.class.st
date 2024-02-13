Class {
	#name : 'ClyDebugWatchOnVariableReadWriteCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
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
