accessing
latestTimeStampsFor: spec

	^ (((self project version allPackagesForSpecNamed: spec)
		collect: [:packageSpec | packageSpec workingCopy packageInfo])
			, {self packageInfo. (Smalltalk classNamed: #BaselineOfSqueakHistory) packageInfo})
				collect: [:package | package -> (self latestTimeStampForPackage: package)]
				as: Dictionary