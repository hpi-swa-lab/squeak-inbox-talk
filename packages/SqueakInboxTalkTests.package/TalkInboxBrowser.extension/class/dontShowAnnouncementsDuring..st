*SqueakInboxTalkTests-preferences
dontShowAnnouncementsDuring: aBlock

	self shouldShowAnnouncements ifFalse: [^ aBlock value].
	
	self shouldShowAnnouncements: false.
	^ aBlock ensure:
		[[self shouldShowAnnouncements: true]
			valueSupplyingAnswer: #('reset all announcements' false)]