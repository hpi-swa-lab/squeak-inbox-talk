asserting
shouldNotChange: valueBlock during: workBlock

	| after before |
	before := valueBlock value.
	workBlock value.
	after := valueBlock value.
	self assert: before equals: after