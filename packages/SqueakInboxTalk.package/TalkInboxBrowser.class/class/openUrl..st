support
openUrl: urlString

	WebBrowser defaultOrNil ifNotNil: [:browser |
		(Project uiManager
			confirm: ('Do you want to open this URL in a web browser?\\{1}' withCRs format: {urlString})
			title: 'Open Web Page' translated) ifTrue: [browser openOnUrl: urlString].
		^ self].
	
	('Open this URL in a web browser:\\{1}' withCRs asText format: {urlString asText addAttribute: (TextURL new url: urlString)}) edit.