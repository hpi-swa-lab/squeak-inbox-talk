actions
setDownloadRange

	| answer range |
	range := self inbox downloadRange.
	answer := Project uiManager
		request: 'When downloading messages, browse as far back as how many days?'
		initialAnswer: range days asString.
	answer isEmptyOrNil ifTrue: [^ false].
	
	range := answer asNumber days.
	self inbox downloadRange: range.
	
	self updateMessages.
	^ true