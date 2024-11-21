converting
asStringOrText

	^ Text streamContents: [:stream |
		self printOn: stream]