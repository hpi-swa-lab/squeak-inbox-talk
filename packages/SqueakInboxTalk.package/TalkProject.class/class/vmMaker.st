accessing
vmMaker

	^ Projects at: #vmMaker ifAbsentPut: [
		self new
			name: 'VM Maker';
			trunkRepository: (self findHttpRepository: 'http://source.squeak.org/VMMaker');
			inboxRepository: (self findHttpRepository: 'http://source.squeak.org/VMMakerInbox')
				label: 'VM Maker Inbox';
			yourself]