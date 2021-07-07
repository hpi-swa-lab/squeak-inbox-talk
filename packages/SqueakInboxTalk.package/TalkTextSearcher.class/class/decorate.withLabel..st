support
decorate: aStringOrText withLabel: label

	label ifNil: [^ aStringOrText].
	
	^ ((label, ':') as: Text) allBold, ' ', aStringOrText