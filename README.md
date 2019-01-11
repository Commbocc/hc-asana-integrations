# Hillsborough County Asana Integrations

## Media Inquiries

### Asana

Tasks within the [Media Inquiries](https://app.asana.com/0/823353078566958/823353078566958) project that have the `156 - Ready for Email` custom field set to `Ready for Email` will trigger the workflow. Upon success the custom field will automatically change to `Sent to Assignee` and an email will be sent to the assignee of the task.

### Zapier

The Workflow of the [Zap](https://zapier.com/app/editor/47959560/overview):

1. __Updated Task in project__ - Specifies the Asana Workspace & Project.
2.  __Only Continue If...__ - Sets a logic gate that only continues the workflow if the `156 - Ready for Email` custom field is set to `Ready for Email`.
3.  __POST__ - A webhook that sends a [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) request to to the _media_inquiries_ endpoint with the Asana Task's data.
    * __URL__ - The _media_inquiries_ endpoint:  `https://hc-asana-integrations.herokuapp.com/media_inquiries.json`
    * __Payload Type__ - the format in which to send the data payload: Set to `Json`.
    * __Data__ - The data (key:value) to be sent to the endpoint: `task_id` set to the ID of the updated task acquired from Step 1.
    * __Basic Auth__ - A pipe (`|`) separated username, password combo for [standard HTTP authentication](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication). See `ASANA_MI_AUTH_NAME` & `ASANA_MI_AUTH_PASS` below.
4. __Send Email__ - The Gmail integration that sends out the email.
    * __To__ - The assignee's email acquired from Step 3: `assignee email`.
    * __From__ - The email of the Gmail account.
    * __From Name__ - The name that the email will say it's from.
    * __Subject__ - The subject of the sent message acquired from the updated task in Step 1.
    * __Body Type__ - Whether the body should use Rich or Plain text. Set to `HTML` for Rich Text.
    * __Body__ - The body of the sent message acquired from Step 3: `html_body`.
    * __Attachments__ - The attachments of the task acquired from Step 3: `attachments download_url`.

### Heroku ![Heroku](https://heroku-badge.herokuapp.com/?app=hc-asana-integrations)

The [Environment Variables](https://devcenter.heroku.com/articles/config-vars) of the [Rails](https://rubyonrails.org/) application [above](#):

* `ASANA_MI_ACCESS_TOKEN` - The [access token](https://asana.com/guide/help/api/api#gl-access-tokens) of the asana user.
* `ASANA_MI_DEFAULT_EMAIL_TO` - If a task has no assignee specified an email will be sent to the email set to this variable.
* `ASANA_MI_AUTH_NAME` - The Basic Authenticatrion Username set in the webhook of the Zap.
* `ASANA_MI_AUTH_PASS` - The Basic Authenticatrion Password set in the webhook of the Zap.
* `ASANA_MI_CF_TRIGGER_ID` - The ID of the Custom Field that will trigger the workflow, i.e. `937985225886128` for `Ready for Email`
* `ASANA_MI_CF_TRIGGER_SENT_ID` The ID of the Custom Field that will be set upon completion, i.e. `973876117543966` for `Sent to Assignee`
