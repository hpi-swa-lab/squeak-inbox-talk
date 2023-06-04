private
fixEncodingIn: aString
	"Particular heuristics for decoding."

	| lastIndex nextIndex |
	(aString isString and: [aString isWideString]) ifFalse: [^ aString].
	self author = 'christoph.thiede@student.hpi.uni-potsdam.de' ifFalse: [^ aString].
	"self date <= (Date year: 2022 month: 11 day: 28)" self date utcMicroseconds < 1669593600000000 ifFalse: [^ aString].
	"self date >= (Date year: 2021 month: 7 day: 9)" self date utcMicroseconds >=  1625788800000000 ifFalse: [^ aString].
	
	self flag: #decoding. "Heuristic. The first author of Squeak Inbox Talk, Christoph Thiede (ct) has flooded squeak-dev with incorrectly encoded messages between 2021-07-09 and 2022-11-27 that were converted into the Unicode replacement character (U+FFFD) for the pipermail archives. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2022-November/222731.html. Here we only fix the two most common encoding patterns. There might be false positives, but I did not find any in the global history of squeak-dev at the time of creating this patch. This patch does not fix the encoding of quoted replies from other authors."
	
	"| string |
	string := aString copyReplaceAll: '����' with: String tab.
	string := string copyWithRegex: '�(?= \p{L})(?<=\} �)' matchesReplacedWith: '·'. ""such as in MCMethodDefinition>>#talkSummaryAndRevision2"".
	^ string"
	
	"Optimized."
	(nextIndex := aString class indexOfAscii: 16rFFFD inString: aString startingAt: (lastIndex := 1)) = 0 ifTrue: [^ aString].
	^ aString species new: aString size * 11 // 10 "+10%" streamContents: [:stream |
		[stream next: nextIndex - lastIndex putAll: aString startingAt: lastIndex.
		(nextIndex + 3 <= aString size and: [(aString basicAt: nextIndex + 1) = 16rFFFD and: [(aString basicAt: nextIndex + 2) = 16rFFFD and: [(aString basicAt: nextIndex + 3) = 16rFFFD]]])
			ifTrue: [
				stream nextPut: $	.
				nextIndex := nextIndex + 4]
			ifFalse: [
				(nextIndex + 2 <= aString size and: [nextIndex > 2 and: [(aString at: nextIndex - 1) = $ and: [(aString at: nextIndex - 2) = $}] and: [(aString at: nextIndex + 1) = $ ] and: [(aString at: nextIndex + 2) isLetter]]])
					ifTrue: [
						stream nextPut: $·.
						nextIndex := nextIndex + 1]
					ifFalse: [
						stream nextPut: (aString at: nextIndex).
						nextIndex := nextIndex + 1]]]
				doWhileTrue: [(nextIndex := aString class indexOfAscii: 16rFFFD inString: aString startingAt: (lastIndex := nextIndex)) > 0].
		stream next: aString size - lastIndex + 1 putAll: aString startingAt: lastIndex]