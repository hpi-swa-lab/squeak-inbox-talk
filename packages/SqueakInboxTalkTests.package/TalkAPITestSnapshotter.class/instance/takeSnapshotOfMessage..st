snapshotting
takeSnapshotOfMessage: aMessage

	^ self
		takeSnapshotOfObject: aMessage
		properties: #(#attachmentNames #author #contributions #conversation #date #hyperkittyUrl #inbox #messageId #nabbleUrl #pipermailUrl #plainText #rawText #replySubject #richText #subject #text)