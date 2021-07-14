preferences
defaultMessageSignature

	^ ('<font color="gray">---\\<i>Sent from {1}</i></font>' withCRs format: {
		(self environment classNamed: #TalkInboxBrowser)
			ifNil: ['Squeak Inbox Talk']
			ifNotNil: ['<a href="{2}"><u><font color="gray">{1}</font></u></a>' format: {TalkInboxBrowser appName. TalkInboxBrowser repositoryUrl}]}) talkAsTextFromHtml