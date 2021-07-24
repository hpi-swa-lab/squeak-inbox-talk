private
allOriginalMatches
	"When a new version of the receiver has been derived (see #deriveCopy), the original match instances have been preserved. Here we gather all of them. This can be used to find the original match positions in a compound match (and has is also proven pretty helpful for debugging purposes)."

	^ Generator on: [:generator |
		originalMatches
			ifEmpty: [generator nextPut: self];
			do: [:originalMatch | generator nextPutAll: originalMatch allOriginalMatches]]