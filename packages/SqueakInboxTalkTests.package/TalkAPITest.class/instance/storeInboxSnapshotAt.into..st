support
storeInboxSnapshotAt: index into: selector
	"
	self do: [:test | test storeInboxSnapshotAt: 2 into: #expectedInboxProperties2].
	self do: [:test | test storeInboxSnapshotAt: 3 into: #expectedInboxProperties3].
	"

	| inbox input |
	input := self inboxSnapshots keys at: index.
	inbox := self buildInbox: input.
	TalkAPITestSnapshotter store: inbox halt intoClass: self class selector: selector