accessing
keyProperty

	^ #snapshotId -> [:object | ids at: object ifAbsentPut: [ids size + 1]]