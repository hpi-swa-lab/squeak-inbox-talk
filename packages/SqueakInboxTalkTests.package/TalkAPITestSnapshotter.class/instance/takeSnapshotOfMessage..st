snapshotting
takeSnapshotOfMessage: anInbox

	^ self
		takeSnapshotOfObject: anInbox
		properties: #(#author #contributions #conversation #date #inbox #nabbleUrl #pipermailUrl #replySubject #subject #text)