accessing
headerText

	| args message |
	message := self selectedMessage ifNil: [^ nil].
	message isArray ifTrue: [^ self perform: message third "headerSelector"].
	
	args := OrderedDictionary new
		at: 'Subject' put: message subject;
		at: 'From' put: message author;
		at: 'Date' put: (message date talkPrettyPrintString asText addAttribute:
			(PluggableTextAttribute evalBlock: [message explainTimezone]));
		yourself.
	
	^ Text streamContents: [:stream |
		args associations
			do: [:keyAndValue | | value |
				stream withAttribute: TextEmphasis bold do: [
					stream
						nextPutAll: keyAndValue key;
						nextPut: $:].
				stream space.
				value := keyAndValue value asStringOrText.
				searchModel hasSearchError ifFalse: [value := self annotateMatchesIn: value].
				stream nextPutAll: value]
			separatedBy: [stream cr]]