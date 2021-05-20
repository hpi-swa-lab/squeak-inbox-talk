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
			package: 'SqueakInboxTalk-Base';
			package: 'SqueakInboxTalk-Core' with: [
				spec
					requires: #('SqueakInboxTalk-Base' 'SqueakInboxTalk-MailingLists');
					preLoadDoIt: #preLoadCore];
			package: 'SqueakInboxTalk-MailingLists' with: [
				spec
					requires: #('SqueakInboxTalk-Base' 'SqueakHistory');
					preLoadDoIt: #preLoadMailingLists];
			package: 'SqueakInboxTalk-UI' with: [spec requires: 'SqueakInboxTalk-Core'].
		"test packages"
		spec
			package: 'SqueakInboxTalk-Tests-Abstract' with: [spec requires: #('JSON' 'SimulationStudio')];
			package: 'SqueakInboxTalk-Tests-Acceptance'
				with: [spec requires: #('SqueakInboxTalk-Tests-Abstract' #app)];
			package: 'SqueakInboxTalk-Tests-Base'
				with: [spec requires: #('SqueakInboxTalk-Tests-Abstract' 'SqueakInboxTalk-Base')];
			package: 'SqueakInboxTalk-Tests-Core'
				with: [spec requires: #('SqueakInboxTalk-Tests-Abstract' 'SqueakInboxTalk-Core')].
		
		"groups"
		spec
			group: #app with: #('SqueakInboxTalk-Core' 'SqueakInboxTalk-UI');
			group: #default with: #(#app #tests);
			group: #tests
				with: #('SqueakInboxTalk-Tests-Acceptance' 'SqueakInboxTalk-Tests-Base' 'SqueakInboxTalk-Tests-Core')]