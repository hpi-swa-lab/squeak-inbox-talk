accessing - urls
hyperkittyUrlForMessageId: messageId thread: thread

	"see: https://gitlab.com/mailman/hyperkitty/-/blob/f8b2bf6e5bfdf7ceada7ad1048f6d039d49fd554/hyperkitty/lib/utils.py#L48"
	| id hash |
	id := messageId.
	(id first = $< and: [id last = $>]) ifTrue: [
		id := id allButFirst allButLast].
	id := id take: 255.
	hash := (Base32MimeConverter mimeEncode:
		(SecureHashAlgorithm new hashMessage: id) asByteArray readStream)
			contents.
	^ 'https://lists.squeakfoundation.org/archives/list/{1}@lists.squeakfoundation.org/{2}/{3}/' format: {self name. thread ifTrue: ['thread'] ifFalse: ['message']. hash}