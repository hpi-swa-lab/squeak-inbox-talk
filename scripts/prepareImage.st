| workspacePath oldArchivePath |
[
	FileStream startUp: true. "Reload stdio file handles"
	TranscriptStream redirectToStdOut: true.
	thisContext insertSender: (Context contextEnsure: [TranscriptStream redirectToStdOut: false]).
	thisContext insertSender: (Context contextOn: UnhandledError, ProvideAnswerNotification do: [:ex |
		Transcript showln: (String streamContents: [:stream | ex signalerContext errorReportOn: stream]).
		Smalltalk snapshot: true andQuitWithExitCode: 1]).
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
	Project current world doOneCycle. "fill caches"

	oldArchivePath := TalkMailingList aggregatorClass archivePath.
	TalkMailingList aggregatorClass archivePath: nil. "maybe not applicable on target host system"
	TalkMailingList wrapperClass closeAllStreams.
] value.

Smalltalk snapshot: true andQuitWithExitCode: 0.

"Recompute filenames for Squeak History"
BaselineOfSqueakInboxTalk new initializeSqhPreferences.
TalkMailingList wrapperClass allSubInstancesDo: [:ea |
	self assert: (ea fileName beginsWith: oldArchivePath).
	ea fileName: TalkMailingList aggregatorClass archivePath , (ea fileName allButFirst: oldArchivePath size)].
