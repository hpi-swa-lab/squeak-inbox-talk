tests
testPrimaryAuthorInitials

	| person |
	person := self classUnderTest new.
	
	person allAuthorInitials: #('aaa.bbb' 'ccc.ddd' 'eee.fff').
	
	self assert: (person allAuthorInitials includes: person primaryAuthorInitials)