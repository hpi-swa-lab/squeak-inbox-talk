icons
iconDeclineRed
	<resourceBy: 'Microsoft Office 365' license: #cc0 url: 'https://support.microsoft.com/en-us/office/insert-images-icons-and-more-in-microsoft-365-c7b78cdf-2503-4993-8664-851085c30fce'>

	^ Icons
		at: #declineRed
		ifAbsentPut: [Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: (ReadStream on: self iconDeclineRedContents))]