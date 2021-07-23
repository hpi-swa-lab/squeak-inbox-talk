patching
patchLevelOfClass: aClass at: selector

	| method |
	method := aClass lookupSelector: selector.
	method ifNil: [^ 0].
	^ method talkTestMethodWrapperCount