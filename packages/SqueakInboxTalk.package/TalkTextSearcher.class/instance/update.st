updating
update

	"Cache."
	regex := (self isActive and: [self usesRegex]) ifTrue: [self compileRegex]