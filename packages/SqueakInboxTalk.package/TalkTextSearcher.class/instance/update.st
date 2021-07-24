private
update
	"Cache. Be aware that this might raise a syntax error."

	regex := (self isActive and: [self usesRegex]) ifTrue: [self compileRegex]