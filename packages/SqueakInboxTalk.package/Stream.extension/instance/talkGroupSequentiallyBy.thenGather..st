*SqueakInboxTalk-Core-enumerating
talkGroupSequentiallyBy: keyBlock thenGather: gatherBlock

	^ Generator on: [:gen | | currentKey currentGroup |
		currentGroup := nil.
		currentKey := nil.
		
		self do: [:each | | key |
			key := keyBlock value: each.
			currentGroup ifNotNil: [
				key = currentKey ifTrue: [currentGroup add: each] ifFalse: [
					gen nextPutAll: (gatherBlock value: currentGroup).
					currentGroup := nil]].
			currentGroup ifNil: [
				currentGroup := OrderedCollection with: each.
				currentKey := key]].
		
		currentGroup ifNotNil: [gen nextPutAll: (gatherBlock value: currentGroup)]]