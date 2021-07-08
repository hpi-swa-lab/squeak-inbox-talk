private
allOriginalMatches

	^ Generator on: [:generator |
		originalMatches
			ifEmpty: [generator nextPut: self];
			do: [:originalMatch | generator nextPutAll: originalMatch allOriginalMatches]]