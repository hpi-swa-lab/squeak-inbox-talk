tests - snapshotting
testSnapshotAndDeserialize

	| snapshotter deserialized foo object snapshot |
	snapshotter := TalkTestSnapshotter new.
	
	foo := 6 @ 7.
	self
		patch: foo
		at: #talkTestTakeSnapshotFor:
		with: [:this :someSnapshotter | someSnapshotter takeSnapshotOfObject: this properties: {#x. #y. [:point | point * 2]}].
	object := JsonObject new
		at: #foo put: foo;
		at: #bar put: #(true nil) asIdentitySet;
		at: #baz put: #(1 'Carpe Squeak!' -0.5) asOrderedCollection;
		yourself.
	
	snapshot := snapshotter takeSnapshotOf: object.
	self assert: snapshot isString.
	
	deserialized := snapshotter class deserialize: (Compiler evaluate: snapshot).
	
	self assertProperties: deserialized in: object.