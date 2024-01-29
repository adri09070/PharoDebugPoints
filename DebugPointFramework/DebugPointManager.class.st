"
I am responsible for managing the debug points.

An exception is the removal of Debug points, which is handled in the ""remove"" method of DebugPoint instances.
"
Class {
	#name : 'DebugPointManager',
	#superclass : 'Object',
	#category : 'DebugPointFramework-Base',
	#package : 'DebugPointFramework',
	#tag : 'Base'
}

{ #category : 'removing' }
DebugPointManager class >> handleClassRemoved: anAnnouncement [

	DebugPoint all copy do: [ :debugPoint |
		debugPoint link methods
			detect: [ :m | m methodClass = anAnnouncement classRemoved ]
			ifFound: [ debugPoint remove ] ]
]

{ #category : 'removing' }
DebugPointManager class >> handleMethodModified: anAnnouncement [
	self removeFromMethod: anAnnouncement oldMethod
]

{ #category : 'removing' }
DebugPointManager class >> handleMethodRemoved: anAnnouncement [
	self removeFromMethod: anAnnouncement method
]

{ #category : 'class initialization' }
DebugPointManager class >> initialize [
	self registerInterestToSystemAnnouncement
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass On: aNode [

	^self installNew: aDebugPointClass On: aNode withBehaviors: {  }.
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass On: aNode withBehaviors: aListOfBehaviorClasses [
	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	| dp ml |
	dp := aDebugPointClass new
		      node: aNode;
		      yourself.



	ml := dp metaLink.

	dp link: ml.
	aNode link: ml.
	DebugPoint add: dp.

	"adding behaviors"
	aListOfBehaviorClasses do: [ :bhc | dp addBehavior: bhc new ].

	self notifyDebugPointAdded: dp.

	^ dp
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableAccessNamed: aSlotNameSymbol [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #all
		  withBehaviors: {  }
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableAccessNamed: aSlotNameSymbol withBehaviors: aListOfBehaviorClasses [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #all
		  withBehaviors: aListOfBehaviorClasses
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableNamed: aSlotNameSymbol accessStrategy: anAccessStrategySymbol [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: anAccessStrategySymbol
		  withBehaviors: {  }
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableNamed: aSlotNameSymbol accessStrategy: anAccessStrategySymbol withBehaviors: aListOfBehaviorClasses [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	| dp ml instanceVariable |
	instanceVariable := aClass slotNamed: aSlotNameSymbol.
	dp := aDebugPointClass new
		      instanceVariable: instanceVariable
		      accessStrategy: anAccessStrategySymbol;
		      yourself.

	ml := dp metaLink.

	dp link: ml.
	aClass
		link: ml
		toSlotNamed: aSlotNameSymbol
		option: anAccessStrategySymbol.
	DebugPoint add: dp.

	"adding behaviors"
	aListOfBehaviorClasses do: [ :bhc | dp addBehavior: bhc new ].

	self notifyDebugPointAdded: dp.

	^ dp
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableReadNamed: aSlotNameSymbol [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #read
		  withBehaviors: {  }
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableReadNamed: aSlotNameSymbol withBehaviors: aListOfBehaviorClasses [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #read
		  withBehaviors: aListOfBehaviorClasses
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableWriteNamed: aSlotNameSymbol [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #write
		  withBehaviors: {  }
]

{ #category : 'API' }
DebugPointManager class >> installNew: aDebugPointClass inClass: aClass onVariableWriteNamed: aSlotNameSymbol withBehaviors: aListOfBehaviorClasses [
	"access strategy can be #all or #read or #write"

	"this should be the single point of installation for debug points, removal is in the remove method of debug point instances"

	^ self
		  installNew: aDebugPointClass
		  inClass: aClass
		  onVariableNamed: aSlotNameSymbol
		  accessStrategy: #write
		  withBehaviors: aListOfBehaviorClasses
]

{ #category : 'announcements' }
DebugPointManager class >> notifyDebugPointAdded: aDebugPoint [

	| announcement |
	announcement := DebugPointAdded 
		on: aDebugPoint
		nodes: aDebugPoint link nodes.
	SystemAnnouncer uniqueInstance announce: announcement
]

{ #category : 'announcements' }
DebugPointManager class >> notifyDebugPointChanged: aDebugPoint [
	
	| announcement |
	announcement := DebugPointChanged
		on: aDebugPoint
		nodes: aDebugPoint link nodes.
	SystemAnnouncer uniqueInstance announce: announcement
]

{ #category : 'announcements' }
DebugPointManager class >> notifyDebugPointRemoved: aDebugPoint fromNodes: nodes [
	"nodes have to be seperate because they will be removed from the debugpoint before this method is called"
	| announcement |
	announcement := DebugPointRemoved
		on: aDebugPoint 
		nodes: nodes.
	SystemAnnouncer uniqueInstance announce: announcement.

		

]

{ #category : 'class initialization' }
DebugPointManager class >> registerInterestToSystemAnnouncement [
	<systemEventRegistration>

	SystemAnnouncer uniqueInstance unsubscribe: self.
	SystemAnnouncer uniqueInstance weak when: MethodRemoved send: #handleMethodRemoved: to: self.
	SystemAnnouncer uniqueInstance weak when: MethodModified send: #handleMethodModified: to: self.
	SystemAnnouncer uniqueInstance weak when: ClassRemoved send: #handleClassRemoved: to: self
]

{ #category : 'removing' }
DebugPointManager class >> removeFromMethod: aMethod [

	DebugPoint all copy do: [ :debugPoint | 
		debugPoint link methods
			detect: [ :m | m == aMethod ]
			ifFound: [ debugPoint removeFromMethod: aMethod ] ]
]
