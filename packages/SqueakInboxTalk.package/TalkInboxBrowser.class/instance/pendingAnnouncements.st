accessing
pendingAnnouncements

	^ pendingAnnouncements ifNil: [pendingAnnouncements :=
		self class pendingAnnouncements]