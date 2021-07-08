instance creation
onMessage: aMessage

	^ (self on: aMessage conversation)
		selectMessage: aMessage;
		yourself