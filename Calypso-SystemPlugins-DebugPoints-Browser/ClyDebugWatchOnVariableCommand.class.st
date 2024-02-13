Class {
	#name : 'ClyDebugWatchOnVariableCommand',
	#superclass : 'ClyDebugVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableCommand class >> debugPointClass [

	^ WatchDebugPoint
]
