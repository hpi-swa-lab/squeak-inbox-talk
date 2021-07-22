accessing
trunk

	^ Projects at: #trunk ifAbsentPut: [
		self new
			name: 'Trunk';
			trunkRepository: MCRepository trunk labels: #('The Trunk' 'Spur');
			inboxRepository: MCRepository inbox label: 'The Inbox';
			treatedRepository: MCRepository treated label: 'The Treated Inbox';
			yourself]