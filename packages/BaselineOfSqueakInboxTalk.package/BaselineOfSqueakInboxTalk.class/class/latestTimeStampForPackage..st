accessing
latestTimeStampForPackage: aPackageInfo

	^ (LatestTimeStamps ifNil: [LatestTimeStamps := Dictionary new])
		at: aPackageInfo name ifAbsentPut:
			[(aPackageInfo methods collect: [:method |
				[TimeStamp fromMethodTimeStamp: method timeStamp] ifError: [TimeStamp new]])
				max]