*SqueakInboxTalk-Core-converting
talkAsByteArray
	"copied from Pharo 5"
	| stream |
	stream := ByteArray new writeStream.
	self digitLength to: 1 by: -1 do: [:digitIndex |
		stream nextPut: (self digitAt: digitIndex)].
	^ stream contents