"
I am a Seaside Request Behavior that can be added to DebugPoints. I return true if and only if the receiver is a WAObject and the sender IP address of the involved HTTP request is listed by me
"
Class {
	#name : 'SeasideRequestBehavior',
	#superclass : 'DebugPointBehavior',
	#instVars : [
		'ip'
	],
	#category : 'DebugPointFramework-Behaviors',
	#package : 'DebugPointFramework',
	#tag : 'Behaviors'
}

{ #category : 'accessing' }
SeasideRequestBehavior class >> uiElement [

	^SeasideRequestUI
]

{ #category : 'initialization' }
SeasideRequestBehavior >> context [
	^self getArgument: #context
]

{ #category : 'execution' }
SeasideRequestBehavior >> execute [
	| receiver |
	receiver := self context receiver .
	(receiver isKindOf: WAObject) ifFalse: [ ^false ].
	^(receiver requestContext request remoteAddress = self ip)

]

{ #category : 'initialization' }
SeasideRequestBehavior >> initialize [ 
	"should be executed before once and count etc."
	super initialize.
	self priority: 50.
]

{ #category : 'execution' }
SeasideRequestBehavior >> ip [
	^ip ifNil: [ '' ].
]

{ #category : 'execution' }
SeasideRequestBehavior >> ip: aString [
	ip := aString
]
