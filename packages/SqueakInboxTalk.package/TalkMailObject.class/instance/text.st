accessing
text

	^ self wrapper valueOfProperty: #talkDecodedBodyText ifAbsentPut: [
		| text |
		text := self wrapper bodyText.
		
		self fixEncodingIn: text]