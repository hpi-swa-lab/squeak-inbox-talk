*SqueakInboxTalk-MailingLists-normalization
talkNormalizeMailAddress: aString withAddressAndInitialsDo: aBlock

	| address initials bracketPos |
	self flag: #moveUpstream.
	
	address := aString.
	initials := Set new.
	
	address ifNotEmpty:
		["Example: 'Stéphane Rollandin <lecteur@zogotounga.net>' "
		(address last = $> and: [(bracketPos := address lastIndexOf: $<) > 0])
			ifTrue: [address := address copyFrom: bracketPos + 1 to: address size - 1]
			ifFalse:
				["Example: 'boris at dialogue.msu.su (Boris G. Chr. Shingarov)' "
				(bracketPos := address indexOf: $() > 0 ifTrue:
					[address := address copyFrom: 1 to: bracketPos - 1]].
		
		address := address copyReplaceAll: ' at ' with: '@'.
		"... "
		"sv04er502"
		"@sneakemail.com ..."
		
		"... '''squeak mailinglist'' <squeak@cs.uiuc.edu'  ... "
		self flag: #performance.
		address := address copyWithoutAll: '"'' <'.
		
		address := address withBlanksTrimmed.
		
		(address includes: $@)
			ifTrue: [address := address asLowercase]
			ifFalse: [
				"Treat address as author initials. Were those mails be sent from within an etoys image?"
				initials add: address.
				address := 'error@doesnotexist.foo']].
	
	^ aBlock value: address value: initials