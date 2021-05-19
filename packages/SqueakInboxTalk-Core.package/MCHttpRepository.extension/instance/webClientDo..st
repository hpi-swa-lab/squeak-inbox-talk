*SqueakInboxTalk-Core-private-Monticello-ct.747-override
webClientDo: aBlock

	| client attemptsLeft response result |
	self class useSharedWebClientInstance ifTrue: [
		"Acquire webClient by atomically storing it in the client variable and setting its value to nil."
		client := webClient.
		webClient := nil ].
	
	client 
		ifNil: [ client := WebClient new ]
		ifNotNil: [ 
			"Attempt to avoid an error by recreating the underlying stream."
			client isConnected ifFalse: [ client close ] ].
		
	attemptsLeft := 3.
	response := nil.
	[ response isNil and: [ attemptsLeft > 0 ] ] whileTrue: [
		response := [ aBlock value: client ]
			on: NetworkError
			do: [ :error |
				attemptsLeft = 0 ifTrue: [ error pass ].
				(3 - attemptsLeft) seconds asDelay wait.
				attemptsLeft := attemptsLeft - 1.
				nil "The response" ] ].	
	
	result := (response code between: 200 and: 299) 
		ifFalse: [
			response content. "Make sure content is read."
			nil ]
		ifTrue: [ 
			(RWBinaryOrTextStream with: (
				response contentWithProgress:  [ :total :amount |
					HTTPProgress new 
						total: total;
						amount: amount;
						signal ])) reset ].

	self class useSharedWebClientInstance
		ifTrue: [
			"Save the WebClient instance for reuse, but only if there is no client cached."
			webClient  
				ifNil: [ webClient := client ]
				ifNotNil: [ client close ] ]
		ifFalse: [ client close ].

	(response code = 404 "Not Found" or: [response code = 410 "Gone"]) ifTrue: [
		"Need to distinguish between lookup errors and connection errors. Lookup errors will be handled by some senders following the EAFP principle. See #versionNamed:."
		(NotFound object: response url) signal ].
	result ifNil: [ NetworkError signal: 'Could not access ', location ].
	^result