Extension { #name : 'WatchDebugPoint' }

{ #category : '*DebugPointUI' }
WatchDebugPoint >> uiElement [ 
	^WatchPresenter new debugPoint: self.
]
