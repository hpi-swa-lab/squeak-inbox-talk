copying
mergedWith: anotherMatch
	"Same like super, but ..."

	self assert: {self object. self key} = {anotherMatch object. anotherMatch key}.
	"No content assertion here, since the receiver is allowed to contain some special text prefix."
	"Base the merge result on anotherMatch instead of the receiver which is a more reliable source of truth in question."
	^ (anotherMatch withStart: self start stop: (self stop max: anotherMatch stop)) addOriginalMatch: self