accessing - fixtures
inboxSnapshots

	^ Dictionary new
		at: (Dictionary new
				at: #mailingList put: self mailingList1;
				at: #now put: (DateAndTime fromString: '2020-06-10T00:16+02:00');
				yourself)
			put: (TalkAPITestSnapshotter deserialize: self expectedInboxProperties1);
		at: (Dictionary new
				at: #mailingList put: self mailingList1;
				at: #now put: (DateAndTime fromString: '2020-06-10T00:16+02:00');
				at: #downloadRange put: 2 weeks;
				yourself)
			put: (TalkAPITestSnapshotter deserialize: self expectedInboxProperties2);
		yourself