accessing - contents
simpleContents
	"Lightweight alternative to #fullContents that is shown until the expensive text has been loaded."
	"Since #fullContents is known usually only to load a few seconds, don't confuse the user with a volatile alternative representation of the conversation here - even if we could."
	"contributions ifEmpty: [^ conversation text]."

	searchModel hasSearchError ifTrue: [^ searchModel debuggableErrorText].
	
	(self hasConversationSelected not and: [self totalFilter isActive]) ifTrue: [^ self emptyContents].
	
	^ nil