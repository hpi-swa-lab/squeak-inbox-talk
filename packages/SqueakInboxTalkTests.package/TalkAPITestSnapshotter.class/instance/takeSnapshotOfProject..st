snapshotting
takeSnapshotOfProject: aProject

	^ self takeSnapshotOfObject: aProject properties: {
		#name.
		#url.
		[:project | {project inboxRepository ifNotNil: #description. project repositoryLabelsForName: #inbox}].
		[:project | {project trunkRepository ifNotNil: #description. project repositoryLabelsForName: #trunk}].
		[:project | {project treatedRepository ifNotNil: #description. project repositoryLabelsForName: #treated}]}