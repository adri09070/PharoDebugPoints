Class {
	#name : 'ClyDebugBreakOnVariableCommand',
	#superclass : 'ClyDebugVariableCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'accessing' }
ClyDebugBreakOnVariableCommand class >> debugPointClass [

	^ BreakDebugPoint
]
