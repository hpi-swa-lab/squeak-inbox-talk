*SqueakInboxTalk-Core-controlling
talkWrap: executeAroundBlock
	"Wrap the receiver with the executeAroundBlock. The block is expected to receive one block as an argument and must evaluate it exactly one time.
	
	Usage:
		[Transcript showln: Utilities authorInitials.
		thisContext wrap: [:block | Utilities useAuthorInitials: 'BANG' during: block].
		Transcript showln: Utilities authorInitials.
		self error: 'Abort'] ensure: [
		Transcript showln: Utilities authorInitials].
	
	Copied from SimulationStudio.
	"

	^ self insertSender: (self class talkContextWrap: executeAroundBlock)