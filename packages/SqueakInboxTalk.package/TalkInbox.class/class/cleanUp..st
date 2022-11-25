initialize-release
cleanUp: aggressive

	aggressive ifTrue: [
		MessageSignature := SendHtmlMessages := nil].
	self clearAllCaches