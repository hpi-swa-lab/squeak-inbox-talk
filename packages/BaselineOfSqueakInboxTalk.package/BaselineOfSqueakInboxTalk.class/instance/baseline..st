baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			package: 'JSON' with: [spec repository: 'https://www.squeaksource.com/PostgresV3'];
			baseline: 'SimulationStudio' with: [
				spec
					repository: 'github://LinqLover/SimulationStudio/packages';
					loads: 'SimulationStudio-Base'];
			baseline: 'SqueakHistory' with: [spec repository: 'github://hpi-swa/squeak-history/packages'].
		"packages"
		
		spec
			package: 'SqueakInboxTalk-Core';
			package: 'SqueakInboxTalk-MailingLists'
				with: [spec requires: #('SqueakInboxTalk-Core' 'SqueakHistory')];
			package: 'SqueakInboxTalk-UI' with: [spec requires: 'SqueakInboxTalk-Core'].
		"test packages"
		spec
			package: 'SqueakInboxTalk-Tests' with: [spec requires: #('JSON' 'SimulationStudio')];
			package: 'SqueakInboxTalk-Tests-Acceptance'
				with: [spec requires: #('SqueakInboxTalk-Tests' #default)];
			package: 'SqueakInboxTalk-Tests-Core'
				with: [spec requires: #('SqueakInboxTalk-Tests' 'SqueakInboxTalk-Core')].
		
		"groups"
		spec
			group: #default with: #('SqueakInboxTalk-Core' 'SqueakInboxTalk-UI' 'SqueakInboxTalk-Tests');
			group: #tests with: #('SqueakInboxTalk-Tests-Acceptance' 'SqueakInboxTalk-Tests-Core')]