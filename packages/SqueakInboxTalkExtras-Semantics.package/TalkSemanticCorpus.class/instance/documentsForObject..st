accessing
documentsForObject: anObject
	"Note: Messages are compared by their identity. Do not provide uncached messages for documents (see TalkDataView>>#cached)!"

	self flag: #todo. "Should we move this up? How could SemanticHelpSearchTopic benefit from this?"
	^ self documentsPerMessage at: anObject ifAbsent: [#()]