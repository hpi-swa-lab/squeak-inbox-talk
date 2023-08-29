matching - private
intervalsForWildcard: term in: aString

	^ Generator on: [:gen |
		self streamIntervalsForWildcard: term in: aString on: gen]