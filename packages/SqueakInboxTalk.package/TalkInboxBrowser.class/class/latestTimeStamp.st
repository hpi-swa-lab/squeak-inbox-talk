self-updating
latestTimeStamp

	^ (self environment classNamed: #BaselineOfSqueakInboxTalk) ifNotNil: [:baseline |
		baseline latestTimeStampFor: self basicSelfUpdateMetacelloSpec]