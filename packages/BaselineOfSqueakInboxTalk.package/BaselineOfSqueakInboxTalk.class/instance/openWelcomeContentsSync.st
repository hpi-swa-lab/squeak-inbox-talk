scripts
openWelcomeContentsSync

	| browser window |
	self initializeSqhPreferences.
	
	browser := TalkInboxBrowser newDefault.
	browser refreshMessages.
	window := UIManager talkDontAttachToMouseCursorDuring: [browser open].
	window center: window owner center.
	
	"Wait while busy"
	[browser backgroundWorkers noneSatisfy: [:process | process isTerminated not]] whileFalse: [100 milliSeconds wait]