tests
testRepositoryLabels

	| inbox treated trunk |
	project := self classUnderTest new.
	
	trunk := Object new.
	inbox := Object new.
	treated := Object new.
	
	project trunkRepository: trunk labels: #('tru' 'nk').
	project inboxRepository: inbox label: 'input'.
	project treatedRepository: treated label: 'deleted'.
	
	self assert: #('input') equals: project inboxRepositoryLabels.
	self assert: (project includesLabel: 'tru').
	self assert: (project includesLabel: 'nk').
	self assert: (project includesLabel: 'input').
	self assert: (project includesLabel: 'deleted').
	self deny: (project includesLabel: 'inbox').
	self deny: (project includesLabel: 'removed')