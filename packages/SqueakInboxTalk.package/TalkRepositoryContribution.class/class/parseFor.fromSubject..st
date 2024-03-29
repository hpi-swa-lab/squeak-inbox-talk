contribution parsing
parseFor: anInbox fromSubject: aString

	| matcher projectLabel versionName |
	matcher := RxParser preferredMatcherClass for: self subjectPattern.
	(matcher matches: aString) ifFalse: [^ nil].
	projectLabel := matcher subexpression: 2.
	versionName := matcher subexpression: 3.
	^ self
		inbox: anInbox
		project: (anInbox projects detect: [:project | project includesLabel: projectLabel] ifNone: [
			(TalkUnrecognizedProject signal: projectLabel) ifNil: [^ nil]])
		versionName: versionName asMCVersionName