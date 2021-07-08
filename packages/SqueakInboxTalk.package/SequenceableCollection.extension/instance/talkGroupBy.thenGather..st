*SqueakInboxTalk-Core-enumerating
talkGroupBy: keyBlock thenGather: gatherBlock

	^ (self talkOrderedGroupBy: keyBlock) gather: gatherBlock