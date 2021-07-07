accessing - toolbuilder
conversationIconAtRow: rowIndex atColumn: columnIndex

	| conversation |
	thisContext talkCheckNonReentrantGuardOr: [
		self flag: #workaround. "This reentrance check should better be moved into the list morph. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-June/215833.html"
		^ nil].
	
	conversation := self conversations at: rowIndex ifAbsent: [^ nil].
	conversation = #searching ifTrue: [^ nil].
	^ columnIndex
		caseOf: {
			["subject"
			2] -> [self iconForContributionState: conversation contributionState].
			["involvement"
			3] -> [TalkPerson hasCurrent ifTrue: [self iconForInvolvementState: conversation involvementState]]}
		otherwise: [nil]