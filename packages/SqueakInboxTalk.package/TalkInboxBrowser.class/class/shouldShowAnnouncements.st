preferences
shouldShowAnnouncements
	<preference: 'Show announcements in inbox browser' category: #'Squeak Inbox Talk' description: 'Learn about new features in Squeak Inbox Talk when browsing mailing lists.' type: #Boolean>

	^ ShowAnnouncements ifNil: [true]