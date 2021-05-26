accessing
ccReceivers

	self flag: #moveUpstream.
	"Move to SqueakHistory?"
	^ MailAddressParser addressesIn: self mailMessage cc