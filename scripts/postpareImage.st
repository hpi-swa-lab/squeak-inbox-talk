| oldArchivePath |
"Recompute filenames for Squeak History"
oldArchivePath := Smalltalk globals at: #SITOldArchivePath.
Smalltalk globals removeKey: #SITOldArchivePath.
self flag: #workaround. "Something is wrong with Environment >> #removeKey:, it does not answer the binding value. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-August/216287.html"

BaselineOfSqueakInboxTalk new initializeSqhPreferences.

TalkMailingList wrapperClass allSubInstancesDo: [:ea |
	self assert: (ea fileName beginsWith: oldArchivePath).
	ea fileName: TalkMailingList aggregatorClass archivePath , (ea fileName allButFirst: oldArchivePath size)].
