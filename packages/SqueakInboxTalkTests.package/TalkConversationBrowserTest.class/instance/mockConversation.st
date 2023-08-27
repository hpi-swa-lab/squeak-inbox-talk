accessing
mockConversation

	^ JsonObject new
		inbox: self mockInbox;
		subject: 'mock subject 0';
		messages: {self mockMessage1. self mockMessage2. self mockMessage3};
		hasContributions: false;
		yourself