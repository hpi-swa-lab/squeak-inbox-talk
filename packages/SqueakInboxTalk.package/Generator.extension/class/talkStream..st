*SqueakInboxTalk-Core-instance creation
talkStream: aBlock

	^ self on: [:generator | aBlock value: [:each | generator yield: each]]