tests
testClearAllCaches

	| downloadRange informed |
	self wrapTest: [:block | self isolateCachesDuring: block].
	
	self deny: browser conversations isEmpty.
	downloadRange := browser inbox downloadRange.
	
	informed := false.
	[[browser clearAllCaches] valueSuppressingMessages: #('*continue*')]
		on: ProvideAnswerNotification
		do: [:ex |
			('*were reset*' match: ex messageText) ifTrue: [informed := true].
			ex resume: true].
	self waitWhileBusy.
	self assert: informed.
	
	self assert: browser conversations isEmpty.
	
	browser inbox downloadRange: downloadRange.
	
	self shouldntFail: [browser refreshMessages].
	self waitWhileBusy.
	self deny: browser conversations isEmpty