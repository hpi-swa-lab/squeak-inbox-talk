| oldArchivePath |
"Recompute filenames for Squeak History"
oldArchivePath := Smalltalk globals removeKey: #SITOldArchivePath.

BaselineOfSqueakInboxTalk new initializeSqhPreferences.

TalkMailingList wrapperClass allSubInstancesDo: [:ea |
	self assert: (ea fileName beginsWith: oldArchivePath).
	ea fileName: TalkMailingList aggregatorClass archivePath , (ea fileName allButFirst: oldArchivePath size)].
