tests - snapshotting
testSnapshotAndDeserialize

	| snapshotter deserialized foo object snapshot |
	snapshotter := TalkTestSnapshotter new.
	self
		patchClass: Point
		at: #talkTestTestTakeSnapshotFor:
		with: [:this :someSnapshotter | this talkTestTakeSnapshotFor: someSnapshotter].
	
	foo := 6 @ 7.
	self
		patch: foo
		at: #talkTestTestTakeSnapshotFor:
		with: [:this :someSnapshotter | someSnapshotter takeSnapshotOfObject: this properties: #(#x #y)].
	object := Dictionary new
		at: #foo put: foo;
		at: #bar put: true;
		at: #baz put: #(1 'Carpe Squeak!' -0.5) asOrderedCollection;
		yourself.
	
	snapshot := snapshotter takeSnapshotOf: object.
	self assert: snapshot isString.
	
	deserialized := snapshotter class deserialize: (Compiler evaluate: snapshot).
	
	self assert: object equals: deserialized