tests
testAccepts

	conversations do: [:ea | self assert: (self testFooAndBar: ea) equals: (filter accepts: ea)]