tests
testAuthorTimestamp

	| message timestamp |
	message := self classUnderTest new.
	self patch: message at: #mail withValue:
		(self patch: Object new at: #authorFullName withValue: 'Xtra Yodeling Zebra').
	self patch: message at: #date withValue: (DateAndTime fromString: '2023-06-22T23:12:53+0200').
	timestamp := '6/22/2023 23:12'.
	
	self patch: message at: #contributions withValue: {
		self patch: Object new at: #author withValue: 'xyz'} during: [
			self assert: 'xyz ' , timestamp equals: message authorTimestamp].
	
	self patch: message at: #contributions withValue: #().
	self patch: message mail at: #authorInitials withValue: #('xyz') during: [
		self assert: 'xyz ' , timestamp equals: message authorTimestamp].
	
	self patch: message mail at: #authorInitials withValue: #('Xyz' 'xyz' 'xtra.yodeling.zebra') during: [
			self assert: 'xyz ' , timestamp equals: message authorTimestamp].
	
	self patch: message mail at: #authorInitials withValue: #() during: [
		self assert: 'Xtra Yodeling Zebra ' , timestamp equals: message authorTimestamp].