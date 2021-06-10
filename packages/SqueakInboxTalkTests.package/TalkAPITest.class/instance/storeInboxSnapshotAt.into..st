tests
storeInboxSnapshotAt: index into: selector
	"
	self do: [:test | test storeInboxSnapshotAt: 2 into: #expectedInboxProperties2].
	"

	| inbox input |
	input := self inboxSnapshots keys at: index.
	inbox := self buildInbox: input.
	TalkAPITestSnapshotter store: inbox halt intoClass: self class selector: selector