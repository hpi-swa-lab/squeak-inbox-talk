accessing
etoys

	^ Projects at: #etoys ifAbsentPut: [
		self new
			name: 'Etoys';
			trunkRepository: (self findHttpRepository: 'http://source.squeak.org/etoys');
			inboxRepository: (self findHttpRepository: 'http://source.squeak.org/etoysinbox')
				label: 'Etoys Inbox';
			yourself]