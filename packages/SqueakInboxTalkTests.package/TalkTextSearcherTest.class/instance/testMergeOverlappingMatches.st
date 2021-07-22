tests - private
testMergeOverlappingMatches

	| contents matches mergedMatches patcher |
	matches := {1 to: 4. 7 to: 12. 8 to: 11. 15 to: 18. 19 to: 23}.
	"We only test the essential merge logic here, exclude newline-based merges."
	contents := String new: 23 withAll: Character cr.
	patcher := nil.
	patcher := [:interval |
		self
			patch: interval at: #contents withValue: contents;
			patch: interval
				at: #mergedWith:
				with: [:thisInterval :otherInterval | patcher value: (thisInterval start to: (thisInterval stop max: otherInterval stop))]].
	matches do: patcher.
	
	self searcher numberOfSurroundingLines: 0.
	mergedMatches := (self searcher mergeOverlappingMatches: matches) contents.
	
	self assert: {1 to: 4. 7 to: 12. 15 to: 23} equals: mergedMatches