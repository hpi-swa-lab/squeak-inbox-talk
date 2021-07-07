searching - private
streamMatchesFrom: anObject label: label contents: aStringOrText on: aStream isLabelSearchable: aBoolean

	(self matchesIn: aStringOrText from: anObject label: label isLabelSearchable: aBoolean) do: [:match | aStream nextPut: match]