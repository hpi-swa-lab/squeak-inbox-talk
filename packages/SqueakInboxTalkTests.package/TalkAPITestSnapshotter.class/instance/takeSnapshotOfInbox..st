snapshotting
takeSnapshotOfInbox: anInbox

	^ self
		takeSnapshotOfObject: anInbox
		properties: #(#contributions #conversations #downloadRange #mailAddress #mostRecentConversations #name)