tests - testing
testIsEmpty

	self assert: #() readStream talkIsEmpty.
	self deny: #(1) readStream talkIsEmpty.
	
	self assert: (Generator on: [:x | ]) talkIsEmpty.
	self deny: (Generator on: [:x | x nextPut: 1]) talkIsEmpty