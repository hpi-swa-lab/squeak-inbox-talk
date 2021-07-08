accessing
nabbleUrl

	| query |
	query := 'subject:"{1}"' format: {self nabbleEscape: self subject}.
	^ 'http://forum.world.st/template/NamlServlet.jtp?macro=search_page&node={1}&sort=date&query={2}' format: {self inbox nabbleNodeId. query encodeForHTTP}