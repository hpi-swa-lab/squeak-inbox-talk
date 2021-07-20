accessing - urls
nabbleUrlForSubject: aString

	| query |
	query := 'subject:"{1}"' format: {self nabbleEscape: aString}.
	^ 'http://forum.world.st/template/NamlServlet.jtp?macro=search_page&node={1}&sort=date&query={2}' format: {self nabbleNodeId. query encodeForHTTP}