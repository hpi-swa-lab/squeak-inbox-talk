initialize-release
cleanUp: aggressive

	aggressive ifTrue: [
		InboxAgeForDanger := InboxAgeForWarning := SelfUpdateMetacelloSpec := SelfUpdateBranch := ShowAnnouncements := UseSimpleIcons := nil].
	HiddenAnnouncementSelectors := nil.
	Icons := Dictionary new.