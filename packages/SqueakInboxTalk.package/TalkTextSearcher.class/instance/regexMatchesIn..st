matching - private
regexMatchesIn: aString

	^ Generator on: [:stream |
		regex matchesIn: aString do: [:match |
			(regex subBeginning: 1)
				with: (regex subEnd: 1)
				do: [:begin :end | stream nextPut: (begin + 1 to: end)]]]