Class {
	#name : 'ClyDebugWatchOnVariableCommand',
	#superclass : 'ClyDebugVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyDebugWatchOnVariableCommand class >> debugPointClass [

	^ WatchDebugPoint
]
