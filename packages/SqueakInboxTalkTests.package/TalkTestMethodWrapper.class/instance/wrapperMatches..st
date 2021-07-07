testing
wrapperMatches: anObject
	^ self isInstanceWrapper ==> [ anObject == object ]