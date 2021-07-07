running
setUp

	| randomSeed |
	super setUp.
	
	randomSeed := self randomSeed.
	Transcript showln: ('{1} random={2}' format: {self. randomSeed}).
	"for reproduction of potential flake tests"
	random := Random seed: randomSeed