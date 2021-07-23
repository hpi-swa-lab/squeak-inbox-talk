patching
unpatchClass: aBehavior at: selector during: workBlock

	| method |
	method := aBehavior lookupSelector: selector.
	^ method talkTestMethodWrapperForBehavior: aBehavior uninstallDuring: workBlock