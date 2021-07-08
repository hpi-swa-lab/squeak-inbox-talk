accessing - toolbuilder
refreshMessagesHelp

	^ 'Download and prepare the latest messages from the mail archive\<b>Last refreshed:</b> {1}' withCRs talkAsTextFromHtml format: {inbox lastRefreshed ifNil: ['never'] ifNotNil: #talkPrintString}