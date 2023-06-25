accessing
ffi

	^ Projects at: #ffi ifAbsentPut: [
		self new
			name: 'FFI';
			trunkRepository: (self findHttpRepository: 'http://source.squeak.org/FFI');
			inboxRepository: (self findHttpRepository: 'http://source.squeak.org/FFIinbox')
				label: 'FFI Inbox';
			treatedRepository: MCRepository treated label: 'The Treated Inbox';
			yourself]