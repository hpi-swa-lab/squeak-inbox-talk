I make it possible to create snapshots of domain-specific object graphs and store them in a test method. The assertion protocol on TalkTestCase (see #assertProperties:in:) can the be used to compare the latest retrieved object graph against the stored snapshot, which can be deserialized via my class-side protocol.

Subclasses can override #takeSnapshotOf: to handle additional types for snapshotting.

I emit a simple list-and-dictionary structure where cycles and multiple occurences of the underlying object have been replaced by symbolic links. The properties of my nodes can be symbols or simple blocks (see #stringifyProperty:).