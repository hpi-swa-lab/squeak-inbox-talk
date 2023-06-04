(PackageInfo named: 'SqueakInboxTalk') postscript: '"add messageTextSelector"
TalkTextSearcher allSubInstancesDo: [:ea |
	(ea instVarNamed: ''messageTextSelector'') ifNil: [
		ea instVarNamed: ''messageTextSelector'' put: ea defaultMessageTextSelector]].
TalkConversationBrowser allSubInstancesDo: [:ea |
	(ea instVarNamed: ''messageFormat'') ifNil: [
		ea instVarNamed: ''messageFormat'' put: ea defaultMessageFormat]].'!
