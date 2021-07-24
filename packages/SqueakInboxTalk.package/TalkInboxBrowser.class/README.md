I display a list of all conversations and contributions of a TalkInbox. Users can filter this list or do a free-text search. They can select any item to read a preview of it. There are buttons to browse the underlying artifacts in additional windows. As the main entry point for Squeak Inbox Talk, I also provide some explaining help contents, a self-updater, and a button to submit feedback - the latter two inspired by Jakob (jr) Reschke's works in Squot.

I make use of background workers (implemented by my superclass) and Generator streams to achieve a responsible display of filtered results.

For further information, read the class comment of TalkInbox.