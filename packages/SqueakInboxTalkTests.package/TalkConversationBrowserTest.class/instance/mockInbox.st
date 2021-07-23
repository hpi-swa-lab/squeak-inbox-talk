accessing
mockInbox

	^ mockInbox ifNil: [
		self patch: TalkInbox basicNew withAllValues: (JsonObject new
			name: 'mock inbox';
			mailAddress: 'list@example.com';
			yourself)]