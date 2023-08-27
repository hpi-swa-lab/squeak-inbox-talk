printing
title

	^ '{1} {2} (not downloaded yet)' format:
		{self messages size.
		'other message' asPluralBasedOn: self messages size}