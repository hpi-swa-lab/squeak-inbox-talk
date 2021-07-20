private
repositoryNamed: aSymbol

	^ repositories at: aSymbol ifAbsent: [nil]