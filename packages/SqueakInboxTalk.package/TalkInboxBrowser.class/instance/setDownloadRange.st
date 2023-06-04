actions
setDownloadRange

	| answer range |
	range := self inbox downloadRange.
	answer := Project uiManager
		request: 'Download messages as far back as how many days...? (can also be #infinite)'
		initialAnswer: (range ifNotNil: [range days asString] ifNil: [#infinite printString]).
	answer isEmptyOrNil ifTrue: [^ false].
	
	range := answer = #infinite printString ifFalse: [answer asNumber days].
	self inbox downloadRange: range.
	
	self refreshMessages.
	^ true