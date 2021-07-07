private
debuggableTextForError: anError

	^ '{1} ({2})' asText format: {
		anError description.
		'click to debug' asText addAttribute: (PluggableTextAttribute evalBlock: [ | hasRaised |
			hasRaised := false.
			[anError tag value] on: Error, Warning, Halt do: [:ex |
				hasRaised := true.
				ex pass].
			hasRaised ifFalse: [anError inspect]])}