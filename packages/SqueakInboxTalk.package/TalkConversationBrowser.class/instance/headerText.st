accessing - state
headerText

	| args message |
	message := self selectedMessage ifNil: [^ nil].
	
	args := OrderedDictionary new
		at: 'Subject' put: message subject;
		at: 'From' put: message author;
		at: 'Date'
			put: (message date talkPrintString asText addAttribute: (TextInspectIt on: message date));
		yourself.
	
	^ Text streamContents: [:stream |
		args associations
			do: [:keyAndValue |
				stream withAttribute: TextEmphasis bold do: [
					stream
						nextPutAll: keyAndValue key;
						nextPut: $:].
				stream space.
				stream nextPutAll: (self annotateMatchesIn: keyAndValue value asStringOrText)]
			separatedBy: [stream cr]]