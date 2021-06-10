tests - snapshotting
testDeserializeAndSnapshot

	| snapshotter snapshot deserialized newSnapshot |
	snapshotter := TalkTestSnapshotter new.
	self patch: snapshotter at: #objectDictionaryClass withValue: OrderedDictionary.
	"guaranteed order for comparison"
	self
		patchClass: Point
		at: #talkTestTestTakeSnapshotFor:
		with: [:this :someSnapshotter | this talkTestTakeSnapshotFor: someSnapshotter].
	snapshot := '(OrderedDictionary new at: #snapshotId put: 1; at: #foo put: (6@7); at: #bar put: (IdentitySet new add: true; add: nil; yourself); at: #baz put: (OrderedCollection new add: 1; add: ''Carpe Squeak!''; add: -0.5; yourself); yourself)'.
	
	deserialized := TalkTestSnapshotter deserialize: (Compiler evaluate: snapshot).
	newSnapshot := snapshotter takeSnapshotOf: deserialized.
	
	self assert: snapshot equals: newSnapshot