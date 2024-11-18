announcements
allAnnouncementSelectors

	 ^ (Pragma allNamed: #talkAnnouncement in: self class)
		collect: [:pragma | pragma selector]