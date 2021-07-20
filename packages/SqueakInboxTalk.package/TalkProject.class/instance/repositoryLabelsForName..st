private
repositoryLabelsForName: aSymbol

	^ repositoryLabels at: aSymbol ifAbsent: [aSymbol = #trunk ifTrue: [{self name}] ifFalse: [#()]]