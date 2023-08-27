self-updating
selfUpdateMetacelloSpec
	<preference: 'Squeak Inbox Talk self-update Metacello spec'
		category: #'Squeak Inbox Talk'
		description: 'The Metacello used for installing updates for Squeak Inbox Talk from the GitHub repository.'
		type: #String>

	^ self basicSelfUpdateMetacelloSpec storeString