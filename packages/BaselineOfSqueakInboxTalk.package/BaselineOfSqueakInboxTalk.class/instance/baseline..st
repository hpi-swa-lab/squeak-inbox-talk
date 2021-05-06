baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"packages"
		spec
			package: 'SqueakInboxTalk-Core';
			package: 'SqueakInboxTalk-UI' with: [spec requires: 'SqueakInboxTalk-Core'].
		"test packages"
		spec
			package: 'SqueakInboxTalk-Tests'
			with: [spec requires: #('SqueakInboxTalk-Core' 'SqueakInboxTalk-UI')].
		
		"groups"
		spec
			group: #default with: #('SqueakInboxTalk-Core' 'SqueakInboxTalk-UI' 'SqueakInboxTalk-Tests');
			group: #tests with: #('SqueakInboxTalk-Tests')]