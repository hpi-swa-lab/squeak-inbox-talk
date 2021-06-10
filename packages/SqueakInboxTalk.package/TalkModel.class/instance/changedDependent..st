updating
changedDependent: aspect

	self instVarNamed: aspect put: nil ifAbsent: [].
	
	self changed: aspect