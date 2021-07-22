searching
searchableProperties

	^ OrderedDictionary new
		at: 'From' put: #author;
		at: 'Date' put: #date;
		at: 'Subject' put: #subject;
		yourself