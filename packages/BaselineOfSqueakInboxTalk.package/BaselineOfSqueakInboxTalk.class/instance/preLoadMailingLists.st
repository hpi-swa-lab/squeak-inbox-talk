scripts
preLoadMailingLists

	| sqhBaseline directory fileNames listSpec |
	sqhBaseline := BaselineOfSqueakHistory new.
	sqhBaseline isCI ifFalse: [^ self
	"Already configured"].
	
	"Make sure to download some demo mails. Copied from SqhMailmanAggregator >> #downloadList:from:to:."
	listSpec := SqhMailmanAggregator allLists detect: [:spec | spec value = 'squeak-dev'].
	SqhMailmanAggregator archivePath: SqhMailmanAggregator archivePathDefault.
	directory := FileDirectory on: SqhMailmanAggregator archivePath, FileDirectory slash, listSpec value.
	directory assureExistence.
	fileNames := ((WebClient httpGet: listSpec key) content findTokens: '"') select: [:ea | (ea endsWith: '.gz') or: [ea endsWith: '.txt']].
	fileNames := fileNames first: 3.
	fileNames
		do: [:fileName | | response stream |
			response := WebClient httpGet: listSpec key, fileName.
			stream := '' writeStream.
			response streamTo: stream size: response contentLength progress: nil.
			(fileName endsWith: '.gz')
				ifTrue: [
					directory
						forceNewFileNamed: (fileName allButLast: 3)
						do: [:outputStream | outputStream nextPutAll: stream contents unzipped]]
				ifFalse: [
					directory
						forceNewFileNamed: fileName
						do: [:outputStream | outputStream nextPutAll: stream contents]]]
		displayingProgress: [:fileName | 'Downloading ', directory localName, ' ... ', fileName].
	
	SqhMailmanAggregator newDefault
		showProgress: true;
		deriveRulesForAuthorKeyNormalization.
	SqhMailmanAggregator newDefault
		showProgress: true;
		resetCacheForMailMessages