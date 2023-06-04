tests - filtering
testFilterCustom

	[self toggleFilter: 'conversations that...' to: true] valueSupplyingAnswer: {'*conversations that*'. 'each subject size even'}.
	self waitWhileBusy.
	
	self shouldBeFiltered: [:conversation | conversation subject size even]