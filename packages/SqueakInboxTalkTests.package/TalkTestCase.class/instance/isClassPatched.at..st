patching
isClassPatched: aClass at: selector

	| method |
	method := aClass lookupSelector: selector.
	((thisContext objectClass: method) includesBehavior: TalkTestMethodWrapper) ifFalse: [^ false].
	^ method isInstanceWrapper not and: [method wrapperMatches: aClass]