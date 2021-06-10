snapshotting
takeSnapshotOf: anObject
	"Take a snapshot of anObject and answer the recorded nested dictionary structure as a storeString. Potential loops will be detected and replaced by link nodes with a single key determined by self class keyProperty."

	^ anObject talkTestTakeSnapshotFor: self