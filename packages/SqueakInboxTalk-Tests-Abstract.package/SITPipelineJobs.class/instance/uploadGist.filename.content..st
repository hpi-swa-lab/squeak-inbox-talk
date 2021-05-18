badges
uploadGist: gistId filename: filename content: aString

	| client request |
	request := JsonObject new
		files: (JsonObject new
			at: filename put: (JsonObject new
				content: aString;
				yourself);
			yourself);
		yourself.
	client := WebClient new.
	client token: self gistToken.
	client
		httpPost: ('https://api.github.com/gists/{1}' format: {gistId})
		content: request asJsonString
		type: 'application/json'
		do: [:req | req headerAt: 'Authorization' put: 'token ', client token]