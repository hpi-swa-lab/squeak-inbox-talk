tests - asserting
testShouldNotChangeDuring

	| x y |
	self
		shouldNotChange: ["constant"
		1]
		during: ["nop"
		].
	x := 1.
	y := 2.
	self shouldNotChange: [x := y] during: [x := y].
	
	self should: [self shouldNotChange: [x] during: [x := x + 1]] raise: TestFailure.
	self should: [self shouldNotChange: [self random next] during: []] raise: TestFailure