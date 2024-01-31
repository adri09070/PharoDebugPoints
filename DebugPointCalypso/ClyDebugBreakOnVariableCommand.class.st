Class {
	#name : 'ClyDebugBreakOnVariableCommand',
	#superclass : 'ClyDebugVariableCommand',
	#category : 'DebugPointCalypso',
	#package : 'DebugPointCalypso'
}

{ #category : 'accessing' }
ClyDebugBreakOnVariableCommand class >> debugPointClass [

	^ BreakDebugPoint
]
