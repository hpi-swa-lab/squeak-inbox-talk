| workspacePath |
thisContext insertSender: (Context contextOn: Error, Warning, Halt, ProvideAnswerNotification do: [:ex |
	ex signalerContext errorReportOn: FileStream stdout]).

"Remove default welcome contents"
(World submorphOfClass: PreferenceWizardMorph) ifNotNil: #delete.
TheWorldMainDockingBar instance closeAllWindows.

workspacePath := [| dir |
	dir := FileDirectory default directoryEntry.
	[(dir / '.project') exists] whileFalse: [dir := dir containingDirectory].
	dir fullName] value.
FileStream stdout nextPutAll: ('Installing SqueakInboxTalk from {1}...\' format: {workspacePath}).
Metacello new
	baseline: 'SqueakInboxTalk';
	repository: 'filetree://' , workspacePath , '/packages';
	load.
FileStream stdout nextPutAll: 'SqueakInboxTalk was installed'; cr.

(Smalltalk classNamed: #BaselineOfSqueakInboxTalk) new openWelcomeContentsSync.
TalkMailingList aggregatorClass archivePath: nil. "maybe not applicable on target host system"
Project current world doOneCycle.

Smalltalk snapshot: true andQuit: true.
