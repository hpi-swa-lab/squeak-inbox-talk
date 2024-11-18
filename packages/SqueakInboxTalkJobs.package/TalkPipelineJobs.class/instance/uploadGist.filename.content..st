gists
uploadGist: gistId filename: filename content: aString

	| client request result |
	request := JsonObject new
		files: (JsonObject new
			at: filename put: (JsonObject new
				content: aString;
				yourself);
			yourself);
		yourself.
	client := WebClient new.
	client token: self gistToken.
	result := client
		httpPost: ('https://api.github.com/gists/{1}' format: {gistId})
		content: request asJsonString
		type: 'application/json'
		do: [:req | req headerAt: 'Authorization' put: 'token ', client token].
	result isSuccess ifFalse: [self error: result content]