matching - dispatch
visit: anObject label: label contents: aStringOrText context: aStream isLabelSearchable: aBoolean

	(self matchesInText: aStringOrText value from: anObject label: label isLabelSearchable: aBoolean) do: [:match | aStream nextPut: match]