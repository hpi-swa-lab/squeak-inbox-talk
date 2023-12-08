construction
addFragmentDocumentsFrom: aMessage
	"Note: Messages are compared by their identity. Do not provide uncached messages for documents (see TalkDataView>>#cached)!"

	| fragmentDocuments |
	fragmentDocuments := super addFragmentDocumentsFrom: aMessage.
	"make sure to store the message for #knownDocuments even if it has zero documents"
	^ (self documentsPerMessage at: aMessage ifAbsentPut: [Set new])
		addAll: fragmentDocuments