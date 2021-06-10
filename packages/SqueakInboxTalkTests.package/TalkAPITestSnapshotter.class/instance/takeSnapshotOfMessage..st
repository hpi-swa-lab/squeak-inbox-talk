snapshotting
takeSnapshotOfMessage: anInbox

	^ self
		takeSnapshotOfObject: anInbox
		properties: #(#author #contributions #conversation #date #inbox #replySubject #subject #text)