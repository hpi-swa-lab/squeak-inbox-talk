accessing - state
numberOfConversations

	self flag: #todo.
	"The existence of this feature is a workaround in the absence of better optimization"
	^ numberOfConversations