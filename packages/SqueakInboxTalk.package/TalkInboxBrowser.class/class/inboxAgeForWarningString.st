preferences
inboxAgeForWarningString
	<preference: 'Inbox age for warning' category: #'Squeak Inbox Talk' description: 'Minimum age for inboxes that should be shown with a warning update reminder. Zero to disable age warnings, leave empty for default.' type: #String>

	^ self stringFromAge: self inboxAgeForWarning