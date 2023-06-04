accessing - toolbuilder
refreshMessagesHelp

	^ 'Download and prepare the latest messages from the mail archive<br><b>Last refreshed:</b> {1}' asTextFromHtml format: {inbox lastRefreshed ifNil: ['never'] ifNotNil: #talkPrettyPrintString}