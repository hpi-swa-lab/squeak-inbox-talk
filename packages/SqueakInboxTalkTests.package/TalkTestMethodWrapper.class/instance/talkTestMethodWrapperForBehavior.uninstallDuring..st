installation
talkTestMethodWrapperForBehavior: aBehavior uninstallDuring: aBlock

	(self isInstanceWrapper not and: [aBehavior == behavior]) ifFalse: [^ method talkTestMethodWrapperForBehavior: aBehavior uninstallDuring: aBlock].
	
	^ self uninstallDuring: aBlock