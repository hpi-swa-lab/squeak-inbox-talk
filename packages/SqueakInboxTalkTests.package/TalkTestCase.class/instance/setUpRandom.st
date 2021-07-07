running
setUpRandom

	| randomSeed |
	randomSeed := self randomSeed.
	Transcript showln: ('{1} random={2}' format: {self. randomSeed}).
	"for reproduction of potential flake tests"
	^ Random seed: randomSeed