tests
testRepositoryAccessors

	| inbox treated trunk |
	project := self classUnderTest new.
	
	trunk := Object new.
	inbox := Object new.
	treated := Object new.
	
	project trunkRepository: trunk.
	project inboxRepository: inbox.
	project treatedRepository: treated.
	
	self assert: trunk equals: project trunkRepository.
	self assert: inbox equals: project inboxRepository.
	self assert: treated equals: project treatedRepository