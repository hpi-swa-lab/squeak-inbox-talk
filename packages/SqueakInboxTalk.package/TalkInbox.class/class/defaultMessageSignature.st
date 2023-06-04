preferences
defaultMessageSignature

	^ ('<font color="gray">---<br><i>Sent from {1}</i></font>' format: {
		(self environment classNamed: #TalkInboxBrowser)
			ifNil: ['Squeak Inbox Talk']
			ifNotNil: ['<a href="{2}"><u><font color="gray">{1}</font></u></a>' format: {TalkInboxBrowser appName. TalkInboxBrowser repositoryUrl}]}) asTextFromHtml