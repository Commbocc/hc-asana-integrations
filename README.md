# Hillsborough County Asana Integrations

## Media Inquiries

### Asana

Tasks within the [Media Inquiries](https://app.asana.com/0/823353078566958/823353078566958) project that have the `156 - Ready for Email` custom field set to `Ready for Email` will trigger the workflow. Upon success the custom field will automatically change to `Sent to Assignee` and an email will be sent to the assignee of the task.

### Zapier

The Workflow of the [Zap](https://zapier.com/app/editor/47959560/overview):

1. `Updated Task in project` - Specifies the Asana Workspace & Project.
2.  `Only Continue If...` - Sets a logic gate that only continues the workflow if the `156 - Ready for Email` custom field is set to `Ready for Email`.
3.  `POST` - A webhook that sends a [POST](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) request to to the _media_inquiries_ endpoint with the Asana Task's data.
    * `URL` - The _media_inquiries_ endpoint:  `https://hc-asana-integrations.herokuapp.com/media_inquiries.json`
    * `Payload Type` - the format in which to send the data payload: Set to `Json`.
    * `Data` - The data (key/value) to be sent to the endpoint: `task_id` set to Step 1's Task ID
    * `Basic Auth` - A pipe (`|`) separated username, password combo for [standard HTTP authentication](https://developer.mozilla.org/en-US/docs/Web/HTTP/Authentication). See `ASANA_MI_AUTH_NAME` & `ASANA_MI_AUTH_PASS` below.
4. `Send Email` - The Gmail integration that sends out the email.
    * `To` - The assignee's email aquired from Step 3.
    * `From` - The emil of the Gmail account.
    * `From Name` - The name that the email will say it's from.
    * `Subject` - The subject of the sent message aquired from Step 1.
    * `Body Type` - Whether the body should use Rich or Plain text. Set to `HTML` for Rich Text.
    * `Body` - The body of the sent message aquired from Step 3.

### Heroku ![Heroku](https://heroku-badge.herokuapp.com/?app=hc-asana-integrations)

The [Environment Variables](https://devcenter.heroku.com/articles/config-vars) of the [Rails](https://rubyonrails.org/) application:

* `ASANA_MI_ACCESS_TOKEN` - The access token of the asana user.
* `ASANA_MI_DEFAULT_EMAIL_TO` - If a task has no assignee specified an email will be sent to the email set to this variable.
* `ASANA_MI_AUTH_NAME` - The Basic Authenticatrion Username set in the webhook of the ZAP.
* `ASANA_MI_AUTH_PASS` - The Basic Authenticatrion Password set in the webhook of the ZAP.
* `ASANA_MI_CF_TRIGGER_ID` - The ID of the Custom Field that will trigger the workflow, i.e. `937985225886128` for `Ready for Email`
* `ASANA_MI_CF_TRIGGER_SENT_ID` The ID of the Custom Field that will be set upon completion, i.e. `973876117543966` for `Sent to Assignee`
