accessing
shouldBeFiltered: conversationBlock

	self shouldBeFiltered.
	browser conversations do: [:conversation | self assert: (conversationBlock value: conversation)]