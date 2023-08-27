accessing
existingForInbox: anInbox

	^ (self corporaOrNil ifNil: [^ nil]) at: anInbox ifAbsent: []