tests - private
testFixEncodingIn

	| ctMail xyzMail |
	ctMail := self classUnderTest new.
	self
		patch: ctMail at: #author withValue: 'christoph.thiede@student.hpi.uni-potsdam.de';
		patch: ctMail at: #date withValue: (DateAndTime year: 2022 month: 11 day: 27).
	self
		assert: '		Tsch�ß!🤣:-)'
		equals: (ctMail fixEncodingIn: '��������Tsch�ß!🤣:-)').
	self
		assert: 'Bag>>explorerContents {*Morphic-Explorer} · ct 2/8/2022 00:15'
		equals: (ctMail fixEncodingIn: 'Bag>>explorerContents {*Morphic-Explorer} � ct 2/8/2022 00:15').
	self
		assert: 'carpe squeak'
		equals: (ctMail fixEncodingIn: 'carpe squeak').
	self
		assert: '�'
		equals: (ctMail fixEncodingIn: '�').
	self
		assert: '} � '
		equals: (ctMail fixEncodingIn: '} � ').
	
	xyzMail := self classUnderTest new.
	self
		patch: xyzMail at: #author withValue: 'xyz@example.com';
		patch: xyzMail at: #date withValue: (DateAndTime year: 2022 month: 11 day: 27).
	self assert: '����' equals: (xyzMail fixEncodingIn: '����').