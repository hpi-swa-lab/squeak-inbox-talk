*SqueakInboxTalk-UI-query
talkCheckNonReentrantGuardOr: aBlock
 
	| ctx |
	[ctx := self findSimilarSender] whileNotNil: [ctx receiver == self receiver ifTrue: [^ aBlock value]].