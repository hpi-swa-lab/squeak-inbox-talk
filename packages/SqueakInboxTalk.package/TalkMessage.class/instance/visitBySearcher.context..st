searching
visitBySearcher: aTextSearcher context: searchContext

	self searchableProperties keysAndValuesDo: [:label :block | | propertyValue |
		propertyValue := (block value: self) asString.
		aTextSearcher visit: self label: label contents: propertyValue context: searchContext].
	
	aTextSearcher visit: self contents: self text context: searchContext