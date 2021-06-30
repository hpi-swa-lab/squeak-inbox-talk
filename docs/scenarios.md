# Scenarios

- [ ] As a one-time contributor (John), I would like to upload a patch to the Squeak Inbox via SIT, in order to get started more seamlessly with contributing to Squeak.
  * **Problem:** The current toolset for contributing to Squeak is not self-explaining and not documented in the image.
  * **Possible solutions:**
    + Guide the user through the Monticello toolset, in the form of an (interactive) tutorial.
    + Wrap the Monticello toolset with another interface that provides a more accurate mapping of the user's workflow.

- [x] As an occasional/one-time contributor (John/Lea), I would like to survey all my pending contributions in SIT, in order to them some contributions forward to eventually being integrated into the trunk.
  * **Problem:** Currently, you can either check your contributions manually, or you have to subscribe to the global squeak-dev mailing list.
    + The former approach requires manual effort and is prone to human errors.
	+ The latter approach will confront you with hosts of messages sent every week checking all of which can be a very time-consuming task.
      You even might want to create a custom message filter in your mailing client to extract messages in which your name appeared, but this is not straightforward and has a very limited efficacy.
  * **Possible solutions:**
    + Decorate each message with a small icon indicating your personal degree participation to it (e.g., created the contribution, commented on another contribution, or have been mentioned). Provide a filter preset that allows you to display messages only in which you have participated to certain of these degrees.
  * **Acceptance criteria:**
    1. Open SIT.
    2. Open the filter menu.
    3. Choose the desired degree of participation, e.g., "conversations in which I (firstname.lastname) have engaged".
    4. See the filtered list of contributions, each decorated with an icon indicating the current state of review (i.e., pending, merged, or treated), and another one indicating which's turn (ours or theirs) it is to reply next.
    5. Select a pending contribution that has received a review/comment by someone else (which is indicated by the turn icon).
    6. Click the "Browse" button to read up the reply(s) you have received.
    7. If any reply requires a response, click the "Reply" button to write a reply message to the conversation.
    8. Write your reply and click the "Send" button to send the message.

- [x] As an co-maintainer of a Squeak package (Nancy/Marius), I would like to survey all pending contributions to this package in SIT, in order to take some contributions forward to eventually being integrated into the trunk.
  * **Problem:** Currently, you can choose from multiple data sources to list contributions:
    + Either you can list all conversations in your mailing client or a mailing archive.
      In this list, however, contributions that did not go through the inbox will appear, too, as well as conversations about contributions to different packages and also conversations that do not belong to any contribution at all.
	  There is no built-in way to filter the relevant conversations.
	  Last but not least, contributions that have reached to Trunk will appear as a second conversation in the mailing list.
	+ Alternatively, you can use the Monticello tools or the SqueakSource webinterface to list all contributions to a certain package.
	  Here, however, no conversational context is shown such as explanations and remarks given later or questions and critiques provided by other people including myself.
  * **Possible solutions:**
    + Decorate each message with an indicator for whether it contains a contribution or not, and if yes, for its current state of review (e.g., pending, merged, or treated). Provide a filter preset that allows you to display contributions only that relate to a certain package and another one for contributions that are in a certain state of review.
  * **Acceptance criteria:**
    1. Open SIT.
    2. Open the filter menu.
    3. Choose the relevant package, e.g., Morphic.
    4. Choose the desired state of review, e.g., pending.
    5. See the filtered list of contributions, each decorated with an icon indicating the current state of review (i.e., pending, merged, or treated), and another one indicating which's turn (ours or theirs) it is to reply next.
    6. Select a pending contribution that has not yet been reviewed.
    7. In the "Open" menu, choose "Inspect version" to read the summary of the patch.
    8. Click the "Merge" button to check out the changes.
    9. Click the "Open" button and then "Reply".
    10. Write down your review and feedback and click "Send".

Further scenarios:

- [ ] Understand connections and related work to a contribution (John, Nancy)
- [x] Browse/explore new conversations (Marius, Teresa)
- [x] Keep trace of particular conversations (Teresa)
