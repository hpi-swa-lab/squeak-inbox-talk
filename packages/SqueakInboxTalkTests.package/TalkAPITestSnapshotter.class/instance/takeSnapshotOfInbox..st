snapshotting
takeSnapshotOfInbox: anInbox

	^ self
		takeSnapshotOfObject: anInbox
		properties: #(#allPackageNames #contributions #conversations #downloadRange #mailAddress #messages #mostRecentConversations #name #projects)