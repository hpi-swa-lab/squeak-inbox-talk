*SqueakInboxTalk-Core-converting
talkAsGenerator

	^ Generator on: [:generator | self do: [:ea | generator yield: ea]]