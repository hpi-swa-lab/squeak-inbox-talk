*SqueakInboxTalk-UI-menus
helpForState: state

	^ state caseOf: {
		[#pending] -> ['contributions that have not yet been processed'].
		[#merged] -> ['contributions that have been approved and integrated into the latest trunk'].
		[#treated] -> ['contributions that have been rejected or superseded by another contribution']}