Class {
	#name : #ClyAddBreakPointCommand,
	#superclass : #ClyDebuggingPointsCommand,
	#category : #DebugPointCalypso
}

{ #category : #testing }
ClyAddBreakPointCommand class >> canBeExecutedInContext: aBrowserContext [

	^ (super canBeExecutedInContext: aBrowserContext)
]

{ #category : #activation }
ClyAddBreakPointCommand class >> contextMenuOrder [
	^1
]

{ #category : #accessing }
ClyAddBreakPointCommand >> defaultMenuIconName [
	^#smallError
]

{ #category : #accessing }
ClyAddBreakPointCommand >> defaultMenuItemName [
	^' Add Breakpoint to: ',  sourceNode displaySourceCode
]

{ #category : #execution }
ClyAddBreakPointCommand >> execute [
	DebugPointInstaller install: BreakDebugPoint On: sourceNode.
]