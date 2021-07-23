*SqueakInboxTalk-Core-utilities-Regex-Core-ct.61-override
escapeString: aString
	"Answer a copy of aString which does not contain any unescaped characters. This is the inverse function of String >> #matchesRegex:.
	NB: Basically, we could simply escape every single character in the string, but this would not produce human-readable outputs."

	| special |
	special := self specialCharacters.
	^ String streamContents: [:stream |
		aString do: [:char |
			(special includes: char) ifTrue: [stream nextPut: $\].
			stream nextPut: char]]