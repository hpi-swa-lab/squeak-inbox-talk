private
removeRedundantLabelsFromMatches: matches

	(matches respondsTo: #next) ifFalse: [^ self removeRedundantLabelsFromMatches: matches talkAsGenerator].
	
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