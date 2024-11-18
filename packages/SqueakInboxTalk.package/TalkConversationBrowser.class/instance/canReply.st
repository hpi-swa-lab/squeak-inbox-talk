testing
canReply

	^ self hasActualMessageSelected and: [self selectedMessage isTalkAnnouncement not]