Extension { #name : 'WatchDebugPoint' }

{ #category : '*DebugPointUI' }
WatchDebugPoint >> uiElement [ 
	^WatchUI new debugPoint: self.
]
