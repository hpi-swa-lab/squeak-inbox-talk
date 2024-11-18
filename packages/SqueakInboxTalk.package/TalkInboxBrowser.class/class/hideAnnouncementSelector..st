announcements
hideAnnouncementSelector: selector

	(HiddenAnnouncementSelectors ifNil: [HiddenAnnouncementSelectors := Set new])
		add: selector.