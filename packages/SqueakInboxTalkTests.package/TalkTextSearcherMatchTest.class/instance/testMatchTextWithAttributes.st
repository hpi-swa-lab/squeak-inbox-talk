tests
testMatchTextWithAttributes

	| originalMatch match actual expected |
	originalMatch := self classUnderTest new
		interval: (7 to: 11);
		yourself.
	match := self classUnderTest new
		contents: '<b>Lorem</b> <i>ips</i>um <s>dolor</s>' asTextFromHtml;
		label: 'label';
		interval: (4 to: 16);
		addOriginalMatch: originalMatch;
		yourself.
	
	expected := '<b>label:</b> <b>em</b> <i><u>ips</u></i><u>um</u> <s>dolo</s>' asTextFromHtml.
	actual := match matchTextWithAttributes: [:someMatch |
		self assert: originalMatch equals: someMatch.
		{TextEmphasis underlined}].
	self assert: expected string equals: actual string.
	self assert: expected runs equals: actual runs