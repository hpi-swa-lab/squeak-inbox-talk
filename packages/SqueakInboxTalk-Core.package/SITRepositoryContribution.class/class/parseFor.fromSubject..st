as yet unclassified
parseFor: anInbox fromSubject: aString

	| matcher project version |
	matcher := RxParser preferredMatcherClass for: self subjectPattern.
	(matcher matches: aString) ifFalse: [^ nil].
	project := matcher subexpression: 2.
	version := matcher subexpression: 3.
	^ self
		project: (anInbox findProjectNamed: project)
		versionName: version asMCVersionName