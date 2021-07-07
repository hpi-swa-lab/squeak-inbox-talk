searching
visitBySearcher: aTextSearcher context: searchContext

	#(#author #date #subject) do: [:propertyName | | propertyValue |
		propertyValue := (propertyName value: self) asString.
		aTextSearcher
			visit: self
			label: propertyName asString capitalized
			contents: propertyValue
			context: searchContext].
	
	aTextSearcher visit: self contents: self text context: searchContext