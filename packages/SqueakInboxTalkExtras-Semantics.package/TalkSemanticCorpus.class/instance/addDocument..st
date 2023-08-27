construction
addDocument: aDocument
	"Note: Messages are compared by their identity. Do not provide uncached messages for documents (see TalkDataView>>#cached)!"

	super addDocument: aDocument.
	^ (documentsPerMessage at: aDocument message ifAbsentPut: [Set new])
		add: aDocument