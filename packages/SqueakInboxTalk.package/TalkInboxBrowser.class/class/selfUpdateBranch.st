self-updating
selfUpdateBranch
	<preference: 'Squeak Inbox Talk self-update branch'
		category: #'Squeak Inbox Talk'
		description: 'The branch used for installing updates for Squeak Inbox Talk from the GitHub repository.'
		type: #String>
	
	^ SelfUpdateBranch ifNil: [self defaultSelfUpdateBranch]