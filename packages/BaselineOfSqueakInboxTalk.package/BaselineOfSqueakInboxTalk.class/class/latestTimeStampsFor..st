accessing
latestTimeStampsFor: spec

	^ (((self project version allPackagesForSpecNamed: spec)
		collect: [:packageSpec | packageSpec workingCopy packageInfo])
			, {self packageInfo. (Smalltalk classNamed: #BaselineOfSqueakHistory) package})
				collect: [:package | package -> (self latestTimeStampForPackage: package)]
				as: Dictionary