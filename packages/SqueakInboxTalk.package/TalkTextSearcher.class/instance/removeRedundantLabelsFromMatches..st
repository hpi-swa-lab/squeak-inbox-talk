private
removeRedundantLabelsFromMatches: matches
	"As a preparation step to generate meaningful text result excerpts, remove redundant labels from the passed matches and answer another generator stream with the cleansed matches. A label is redundant if the previous match is a pseudo match and refers to the same object or key."

	(matches respondsTo: #next) ifFalse: [^ self removeRedundantLabelsFromMatches: matches readStream].
	
	^ Generator on: [:generator |
		matches atEnd ifFalse: [ | current |
			current := matches next.
			[
				generator yield: current.
				matches atEnd] whileFalse: [ | next previous |
				next := matches next.
				previous := current.
				
				current := (previous isPseudoMatch and: [{previous object. previous key} = {next object. next key}])
					ifTrue: [
						next deriveCopy
							label: nil;
							yourself]
					ifFalse: [next]]]]