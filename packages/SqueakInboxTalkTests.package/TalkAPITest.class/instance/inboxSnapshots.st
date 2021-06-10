accessing - fixtures
inboxSnapshots

	^ OrderedDictionary new
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
		at: (Dictionary new
				at: #mailingList put: self mailingList1;
				at: #now put: (DateAndTime fromString: '2020-06-10T00:16+02:00');
				at: #downloadRange put: 180 days;
				at: #projects put: (Dictionary new
					at: #trunkRepository put: #();
					at: #inboxRepository put: {
						MCVersionInfo
							name: 'Squeakland-author.123.mcz'
							id: 1
							message: 'Fix a sljp'
							date: (Date fromString: '2020-05-07')
							time: (Time fromString: '12:34:56.1200+01:00')
							author: 'author'
							ancestors: #()};
					at: #treatedRepository put: #();
					yourself);
				yourself)
			put: (TalkAPITestSnapshotter deserialize: self expectedInboxProperties3);
		yourself