accessing
involvementStateFor: aPerson

	| hadLastWord involvement |
	involvement := self involvementFor: aPerson.
	involvement ifNil: [^ nil].
	
	involvement = #mentioned ifTrue: [^ #mentioned].
	
	hadLastWord := (self messages size = 1 and: [self inbox squeakSourceMailers includes: self messages last author]) or: [self messages last wasAuthoredBy: aPerson].
	^ hadLastWord ifFalse: [#newReply] ifTrue: [#lastWord]