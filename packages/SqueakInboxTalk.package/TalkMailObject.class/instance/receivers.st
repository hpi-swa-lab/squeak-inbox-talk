accessing
receivers

	self flag: #moveUpstream.
	"Move to SqueakHistory?"
	^ MailAddressParser addressesIn: self mailMessage to