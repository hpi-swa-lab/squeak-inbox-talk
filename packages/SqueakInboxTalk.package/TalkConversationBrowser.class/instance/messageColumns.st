accessing
messageColumns

	^ {#author} collect: [:columnBlock | "[:message | message date talkPrintString]. "
	self messages collect: columnBlock]