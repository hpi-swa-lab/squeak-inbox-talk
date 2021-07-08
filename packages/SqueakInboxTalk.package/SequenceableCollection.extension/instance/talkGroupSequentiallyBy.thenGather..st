*SqueakInboxTalk-Core-enumerating
talkGroupSequentiallyBy: keyBlock thenGather: gatherBlock

	^ (self readStream talkGroupSequentiallyBy: keyBlock thenGather: gatherBlock) contents