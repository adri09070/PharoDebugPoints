Class {
	#name : 'ClyDebugWatchOnVariableWriteCommand',
	#superclass : 'ClyDebugWatchOnVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
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
