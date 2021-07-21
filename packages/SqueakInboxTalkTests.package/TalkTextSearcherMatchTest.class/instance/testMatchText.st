tests
testMatchText

	| match actual expected |
	match := self classUnderTest new
		contents: '<b>Lorem</b> <i>ips</i>um <u>dolor</u>' asTextFromHtml;
		label: 'label';
		interval: (7 to: 11);
		yourself.
	
	expected := '<b>label:</b> <i>ips</i>um' asTextFromHtml.
	actual := match matchText.
	self assert: expected string equals: actual string.
	self assert: expected runs equals: actual runs