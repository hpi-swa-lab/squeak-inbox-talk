snapshotting
takeSnapshotOfContribution: aContribution

	^ self takeSnapshotOfObject: aContribution properties: #(#conversations #state #summary)