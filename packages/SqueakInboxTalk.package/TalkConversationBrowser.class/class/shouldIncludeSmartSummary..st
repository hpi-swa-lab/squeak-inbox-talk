preferences
shouldIncludeSmartSummary: aBoolean

	ShouldIncludeSmartSummary := aBoolean.
	
	aBoolean ifTrue: [
		(Smalltalk hasClassNamed: #ChatGPT) ifFalse: [
			(self confirm: 'Install ChatGPT?') ifTrue: [
				TalkInboxBrowser metacelloBaseline installChatGPT.
				self inform: 'Please set an OpenAI key in the preferences!']]].