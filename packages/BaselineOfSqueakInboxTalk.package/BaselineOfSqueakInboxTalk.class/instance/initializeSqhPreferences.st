scripts
initializeSqhPreferences
	"Initialize SqueakHistory preferences."

	| aggregatorClass |
	aggregatorClass := TalkMailingList aggregatorClass.
	(FileDirectory on: aggregatorClass archivePathDefault) assureExistence.
	aggregatorClass archivePath: aggregatorClass archivePathDefault.