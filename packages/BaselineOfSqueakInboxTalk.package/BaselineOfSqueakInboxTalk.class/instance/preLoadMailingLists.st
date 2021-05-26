scripts
preLoadMailingLists

	| aggregatorClass |
	self isCI ifFalse: [^ self].
	
	"Initialize SqueakHistory preferences."
	aggregatorClass := TalkMailingList aggregatorClass.
	aggregatorClass archivePath: aggregatorClass archivePathDefault