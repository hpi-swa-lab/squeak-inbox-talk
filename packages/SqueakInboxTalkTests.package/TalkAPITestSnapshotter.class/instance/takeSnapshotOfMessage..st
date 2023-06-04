snapshotting
takeSnapshotOfMessage: aMessage

	^ self
		takeSnapshotOfObject: aMessage
		properties: #(#attachmentNames #author #contributions #conversation #date #inbox #nabbleUrl #pipermailUrl #plainText #rawText #replySubject #richText #subject #text)