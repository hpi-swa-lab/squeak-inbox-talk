accessing
trunk

	^ TalkProjects at: #trunk ifAbsentPut: [
		self new
			name: 'Trunk';
			trunkRepository: MCRepository trunk;
			inboxRepository: MCRepository inbox;
			treatedRepository: MCRepository treated;
			yourself]