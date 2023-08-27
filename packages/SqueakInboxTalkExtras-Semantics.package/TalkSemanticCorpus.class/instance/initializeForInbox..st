initialize-release
initializeForInbox: anInbox

	inbox := anInbox.
	self inbox when: #refreshMessages send: #updateFromInbox to: self.