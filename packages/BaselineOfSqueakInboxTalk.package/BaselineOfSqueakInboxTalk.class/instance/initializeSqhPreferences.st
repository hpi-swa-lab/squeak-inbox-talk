scripts
initializeSqhPreferences
	"Initialize SqueakHistory preferences."

	| aggregatorClass |
	aggregatorClass := TalkMailingList aggregatorClass.
	aggregatorClass archivePath: aggregatorClass archivePathDefault