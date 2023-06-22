# Usage

In the following, some common workflows are described that can be reproduced in Squeak Inbox Talk.
While most operations should be intuitive, this document may be treated as a (rather) complete list of features.

## The inbox browser

- Use the main docking bar > **Apps** > **Squeak Inbox Talk** to open the inbox browser.

- Press the **Contribute** button to submit a new contribution via Monticello or to write a new message to the list.

- Press **Refresh** to download the latest messages into your image.
  The tooltip of the button and the its color will indicate when you have refreshed the inbox the last time.
  You can change the color indication in the preferences.

- Select any conversation or contribution in the list to read a preview of it.
  **The icons on the left** indicate the current contribution state of each contribution.
  **The icons on the right** indicate your personal involvement.
  To see them, you need to **edit your user information first** via the settings button in the right top corner.
  Hover any icon to see further information.

- Yellow-click a conversation to inspect it or generate a link to one of the online mailing list archives to it.

- Enter some text into the **search bar** in order to search all conversations and contributions for it.
  The search text can consist of multiple terms separated by space - every result needs to contain all terms.
  You can enclose multiple words into quotes in order to search for them as a single multi-word term.
  Use a backslash (`\`) to escape quotes or backslashes that should be searched literally in the text.

  Toggle the <kbd>Aa</kbd> button next to search bar to turn case sensitivity on or off.
  Toggle the <kbd>|_|</kbd> button next to it to to turn "search whole words only" on or off.
  Press the ellipsis button (<kbd>...</kbd>) next to it in order to switch between regular (exact) matching, fuzzy matching (which is slower, but also finds typos), and regular expression search (which does not support multiple search terms).

  Press **<kbd>Enter</kbd>** to select the next result in the conversation list, or press **<kbd>Shift</kbd> + <kbd>Enter</kbd>** to select the previous result in the list.
  
  If your search term has an error, it will be displayed in the pane right below.

  Select any search result in the list to see all matches in the text.
  Click the **read on** link to jump to the full conversation in a new window.

- Press the **Filter** button to filter all conversations and contributions:

  * The options **conversations with/without contributions** allow you to filter conversations based on whether they contain a contribution.
  * The options **contributions with state ...** allow you to display conversations only that are related to contributions with a certain state, i.e., contributions that are still pending review, already have been merged into the Trunk, autc.
  * The third filter group allows you to display conversations only that you are **involved** into, e.g., because you started the conversation or have been mentioned in any message.
  * The fourth filter group allows to filter conversations based on the **domain** they contribute to.
    For instance, select **contributions to packages** and in the dialog, choose **Morphic** and **MorphicExtras**, and accept the dialog.
  * The second last filter group, **conversations that,** allow you to filter conversations based on custom Smalltalk expressions.
    To test it out, just try out the predefined filter expression or adjust it.
	You can also refer to the inbox instance by using `self`.
  
  Of course, you can combine multiple filters, or combine them with text search or reset them at any time.
  You can also type-to-filter in the conversations list.

- Press the **Open** button to read all messages of the currently selected conversation.

- Press the **Browse contribution** button to **view the changes** of the currently selected contribution, **inspect** the underlying Monticello version, or inspect the contribution object.

- Press the **settings button** in the right top corner of the program to adjust settings of the tool and see further options:
  * **Choose another inbox** such as **vm-dev** to browse it.
  * **Edit user information** allows you to enter your name, e-mail address, or author initials, in order to use the involvement filters.
  * By clicking **set download range,** you can fetch older messages.
  * By clicking **edit message signature,** you can change the default text that will be appended to every message you send.
  * By clicking **edit preferences,** you can change additional options for Squeak Inbox Talk.
    + The **html mode** (experimental!) for sending messages currently does not support the built-in mail editor in Squeak Trunk.
      You will need to use a custom `MailSender` for this, or send me a direct message.
  * **Clear all caches** allows you to reset all caches in the tool.
    This can be helpful if something breaks after downloading newer messages or interrupting the tests, but all messages will need to be fetched again afterwards.
  * Press **Show credits** to see all multimedia resources that are used in Squeak Inbox Talk.
    (Currently, this only affects icons that are compatible to the MIT license.)
  * Press **self-update** to install the latest version of the tool.
    The update branch can be changed in the prefrences.
  * Press **send feedback** to send me some feedback about the tool - this would be great! :-)

## The conversation browser

After you have opened any conversation from the inbox brwoser, you will see a list of messages in this conversation in the conversation browser.

- Select any message to read it.

- You can also yellow-click any message to inspect it or to generate a URL from it.

- You can also use the search bar here analogously to the inbox browser.
  Press <kbd>Enter</kbd> or <kdb>Shift</kbd> + <kbd>Enter</kbd> to jump to the next resp. previous match.

- Press **Reply** to write a reply message to the currently selected message.
  You can also add attachments to your message from that window.

- Press **Attachments** to view any attachments of the message in the image.

- Press the **format button** on the right to switch between viewing the current message in rich text (HTML), in plain text, or viewing its raw sources.
  You can change the default format in the preferences.

## Reading other inboxes

Next to selecting a well-known inbox such as **squeak-dev** or **vm-dev** from the Settings menu of the inbox browser default, you can also browse any other inbox instead.
For example, evaluate the following in a workspace to browse the **cuis-dev** list:

```smalltalk
(TalkInbox on: (TalkMailingList named: 'cuis-dev')) browse.
```
