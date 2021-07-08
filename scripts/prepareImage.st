| workspacePath |
workspacePath := [| dir |
	dir := FileDirectory default directoryEntry.
	[(dir / '.project') exists] whileFalse: [dir := dir containingDirectory].
	dir fullName] value.

"Remove default welcome contents"
(World submorphOfClass: PreferenceWizardMorph) ifNotNil: #delete.
TheWorldMainDockingBar instance closeAllWindows.

Metacello new
	baseline: 'SqueakInboxTalk';
	repository: 'filetree://' , workspacePath , '/packages';
	load.

(Smalltalk classNamed: #BaselineOfSqueakInboxTalk) new openWelcomeContentsSync.
TalkMailingList aggregatorClass archivePath: nil. "maybe not applicable on target host system"
Project current world doOneCycle.

Smalltalk snapshot: true andQuit: true.
