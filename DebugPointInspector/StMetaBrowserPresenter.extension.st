Extension { #name : 'StMetaBrowserPresenter' }

{ #category : '*DebugPointInspector' }
StMetaBrowserPresenter >> breakOnCallToSelectedMethod [

	| method |
	method := self selectedMethod ifNil: [ ^ self ].
	self model breakOnCallTo: method selector
]

{ #category : '*DebugPointInspector' }
StMetaBrowserPresenter >> breakOnceOnCallToSelectedMethod [

	| method |
	method := self selectedMethod ifNil: [ ^ self ].
	self model breakOnceOnCallTo: method selector
]
