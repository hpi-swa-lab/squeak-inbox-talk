*SqueakInboxTalk-MailingLists-normalization
talkNormalizeMailAddress: aString withAddressAndInitialsDo: aBlock

	| address initials |
	self flag: #moveUpstream.
	
	address := aString.
	initials := Set new.
	
	"Example: 'boris at dialogue.msu.su (Boris G. Chr. Shingarov)' "
	address := address copyFrom: 1 to: (address findString: '(') - 1.
	address := address copyReplaceAll: ' at ' with: '@'.
	"... "
	"sv04er502"
	"@sneakemail.com ..."
	
	"... '''squeak mailinglist'' <squeak@cs.uiuc.edu'  ... "
	self flag: #performance.
	address := address copyWithoutAll: '"'' <'.
	
	address := address withBlanksTrimmed.
	
	(address includesSubstring: '@')
		ifTrue: [address := address asLowercase]
		ifFalse: [
			"Treat address as author initials. Were those mails be sent from within an etoys image?"
			initials add: address.
			address := 'error@doesnotexist.foo'].
	
	^ aBlock value: address value: initials