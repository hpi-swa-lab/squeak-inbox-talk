| workspacePath |
FileStream startUp: true. "Reload stdio file handles"
TranscriptStream redirectToStdOut: true.
thisContext insertSender: (Context contextEnsure: [TranscriptStream redirectToStdOut: false]).
thisContext insertSender: (Context contextOn: UnhandledError, ProvideAnswerNotification do: [:ex |
	Transcript showln: (String streamContents: [:stream | ex signalerContext errorReportOn: stream])]).
thisContext
	insertSender: (Context contextOn: ProgressInitiationException do: [:ex |
		ex sendNotificationsTo: [:min :max :curr | Transcript showln: ('[Progress] [{1}/{2}:{3}] {4}' format: {curr. min. max. ex messageText})]]);
	insertSender: (Context contextOn: ProgressNotification do: [:ex |
		Transcript showln: ('[Progress] {1}' format: {({ex messageText. ex extraParam}) joinSeparatedBy: $|}).
		ex resume]).

"Remove default welcome contents"
(World submorphOfClass: PreferenceWizardMorph) ifNotNil: #delete.
TheWorldMainDockingBar instance closeAllWindows.

workspacePath := [| dir |
	dir := FileDirectory default directoryEntry.
	[(dir / '.project') exists] whileFalse: [dir := dir containingDirectory].
	dir fullName] value.
Transcript show: ('Installing SqueakInboxTalk from {1}... ' format: {workspacePath}).
Metacello new
	baseline: 'SqueakInboxTalk';
	repository: 'filetree://' , workspacePath , '/packages';
	load.
Transcript showln: 'SqueakInboxTalk was installed'.

(Smalltalk classNamed: #BaselineOfSqueakInboxTalk) new openWelcomeContentsSync.
TalkMailingList aggregatorClass archivePath: nil. "maybe not applicable on target host system"
Project current world doOneCycle.

Smalltalk snapshot: true andQuit: true.
