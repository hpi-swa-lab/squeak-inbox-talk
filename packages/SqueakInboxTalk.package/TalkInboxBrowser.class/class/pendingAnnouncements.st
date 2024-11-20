announcements
pendingAnnouncements

	self shouldShowAnnouncements ifFalse: [^ #()].
	
	^ Array streamContents: [:stream |
		self checkSelfUpdatesIfFound: [:date | stream nextPut: (self selfUpdateAnnouncementFor: date)].
		(self allAnnouncementSelectors copyWithoutAll: (HiddenAnnouncementSelectors ifNil: [#()])) do: [:selector |
			stream nextPut: (self perform: selector)]]