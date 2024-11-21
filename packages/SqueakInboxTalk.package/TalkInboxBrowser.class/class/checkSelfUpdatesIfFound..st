self-updating
checkSelfUpdatesIfFound: dateBlock

	| selfUpdateTimeStamps response selfUpdateTimeStampsUrl hasUpdates |
	selfUpdateTimeStampsUrl := 'https://gist.githubusercontent.com/LinqLover/36dd3c4a155eed5aa7e874415cd60eea/raw/{1}.json' format: {('latestTimeStamps/{1}' format: {'refs/heads/' , self selfUpdateBranch}) asFileName encodeForHTTP}.
	response := WebClient httpGet: selfUpdateTimeStampsUrl.
	response isSuccess ifFalse: [^ false].
	
	selfUpdateTimeStamps := response content parseAsJson timeStamps
		collect: [:ea | ea asDateAndTime asTimeStamp].
	
	hasUpdates := self latestPackageTimeStamps associations anySatisfy: [:packageInfoAndTimeStamp |
		selfUpdateTimeStamps
			at: packageInfoAndTimeStamp key name
			ifPresent: [:selfUpdateTimeStamp | selfUpdateTimeStamp > packageInfoAndTimeStamp value]
			ifAbsent: [true]].
	
	^ hasUpdates ifTrue:
		[dateBlock value:
			(selfUpdateTimeStamps max asDateAndTime asLocalAt: DateAndTime localOffset) "timestamps dont have timezones"]