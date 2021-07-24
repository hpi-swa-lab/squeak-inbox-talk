accessing - text
matchTextWithAttributes: matchAttributes

	| text |
	text := self basicMatchText asText copy.
	self annotateText: text withAttributes: matchAttributes offset: 1 - self start.
	^ self withLabelDecorate: text