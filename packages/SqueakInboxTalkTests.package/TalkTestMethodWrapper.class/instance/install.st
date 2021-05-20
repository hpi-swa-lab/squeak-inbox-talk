installation
install

	| class |
	class := behavior ifNil: [object class].
	method := class methodDictionary at: selector ifAbsent: [#new].
	class methodDictionary at: selector put: self.