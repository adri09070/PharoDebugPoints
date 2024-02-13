Class {
	#name : 'ClyAddWatchDebugPointCommand',
	#superclass : 'ClyDebuggingPointsCommand',
	#category : 'Calypso-SystemPlugins-DebugPoints-Browser',
	#package : 'Calypso-SystemPlugins-DebugPoints-Browser'
}

{ #category : 'testing' }
ClyAddWatchDebugPointCommand class >> canBeExecutedInContext: aBrowserContext [

	^ (super canBeExecutedInContext: aBrowserContext)
]

{ #category : 'activation' }
ClyAddWatchDebugPointCommand class >> contextMenuOrder [
	^4
]

{ #category : 'accessing' }
ClyAddWatchDebugPointCommand >> defaultMenuIconName [
	^#history
]

{ #category : 'accessing' }
ClyAddWatchDebugPointCommand >> defaultMenuItemName [
	^' Add Watch to: ',  sourceNode displaySourceCode
]

{ #category : 'execution' }
ClyAddWatchDebugPointCommand >> execute [

	| dp | 
	dp := DebugPointManager installNew: WatchDebugPoint On: sourceNode.
	self putIconInProperties: dp
]