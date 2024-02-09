copying
postCopyAfterDocuments: postCopyDocumentsBlock

	| documentCopies |
	super postCopyAfterDocuments: postCopyDocumentsBlock.
	
	documentsPerMessage ifNil: [^ self].
	
	documentCopies := postCopyDocumentsBlock value.
	documentsPerMessage := documentsPerMessage collect: [:oldDocuments |
		oldDocuments collect: [:oldDocument |
			documentCopies at: oldDocument]].