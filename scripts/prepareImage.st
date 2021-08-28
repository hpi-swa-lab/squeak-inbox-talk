| workspacePath oldArchivePath |
"Remove default welcome contents"
(World submorphOfClass: PreferenceWizardMorph) ifNotNil: #delete.
TheWorldMainDockingBar instance closeAllWindows.

"Install SIT"
workspacePath := [| dir |
	dir := FileDirectory default directoryEntry.
	[(dir / '.project') exists] whileFalse: [
		dir = (dir := dir containingDirectory) ifTrue: [
			self error: 'repository not found']].
	dir fullName] value.
Transcript showln: ('Installing SqueakInboxTalk from {1}... ' format: {workspacePath}).
Metacello new
	baseline: 'SqueakInboxTalk';
	repository: 'filetree://' , workspacePath , '/packages';
	load.
Transcript showln: 'SqueakInboxTalk was installed'.

"Prepare world"
(Smalltalk classNamed: #BaselineOfSqueakInboxTalk) new openWelcomeContentsSync.
"Fill caches"
TalkInbox squeakDev contributions do: #state.
Project current world doOneCycle.

"Cleanup, see also postpareImage.st."
oldArchivePath := TalkMailingList aggregatorClass archivePath.
Smalltalk globals at: #SITOldArchivePath put: oldArchivePath.
TalkMailingList aggregatorClass archivePath: nil. "maybe not applicable on target host system"
TalkMailingList wrapperClass closeAllStreams.
