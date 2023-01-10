preferences
inboxAgeForDangerString
	<preference: 'Inbox age for danger' category: #'Squeak Inbox Talk' description: 'Minimum age for inboxes that should be shown with a danger update reminder. Zero to disable age dangers, leave empty for default.' type: #String>

	^ self stringFromAge: self inboxAgeForDanger