preferences
shouldShowAnnouncements: aBoolean

	aBoolean ifTrue:
		[(self confirm: 'Reset all announcements?') ifTrue:
			[self resetAnnouncements]].
	ShowAnnouncements := aBoolean.