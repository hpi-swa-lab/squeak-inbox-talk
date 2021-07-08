accessing
contributionState

	self contributions ifEmpty: [^ nil].
	
	"expensive!"
	self flag: #todo.
	"eh, this would be possible during parsing... dont't hardcode here!"
	self messages first in: [:message |
		self flag: #hacked.
		(message subject beginsWith: 'The Trunk:') ifTrue: [^ #merged
		"(message subject beginsWith: 'The Inbox:') ifTrue: [^ #pending]"]].
	(self contributions anySatisfy: [:contribution | contribution state = #pending]) ifTrue: [^ #pending].
	(self contributions allSatisfy: [:contribution | contribution state = #treated]) ifTrue: [^ #treated].
	^ #merged