Class {
	#name : #TranscriptDebugPoint,
	#superclass : #DebugPoint,
	#instVars : [
		'text'
	],
	#category : #DebugPointImplementations
}

{ #category : #execution }
TranscriptDebugPoint >> hitWithContext: aContext [
	<debuggerCompleteToSender>
	
	super hitWithContext: aContext.

	Transcript show: self text.
]

{ #category : #accessing }
TranscriptDebugPoint >> text [
	^text ifNil: [ '' ]
]

{ #category : #accessing }
TranscriptDebugPoint >> text: aString [
	text := aString
]

{ #category : #accessing }
TranscriptDebugPoint >> uiElement [

	^TranscriptUI new behavior: self.
]