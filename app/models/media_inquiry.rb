class MediaInquiry
  include AsanaClient

  attr_reader :task_id

  def initialize(task_id)
    @task_id = task_id
  end

  def task
    get_task(@task_id)
  end

  def assignee
    if task.assignee
      get_user(task.assignee['gid'])
    else
      OpenStruct.new(email: ENV["ASANA_MI_DEFAULT_EMAIL_TO"])
    end
  end

  def stories
    asana_client.get("/tasks/#{@task_id}/stories").body['data'].map { |s| OpenStruct.new(s.to_h) }
  end

  def comments
    stories.select{ |s| s.resource_subtype == 'comment_added' }.map do |s|
      comment = OpenStruct.new(s.to_h)
      comment.created_at = s.created_at.to_datetime.in_time_zone("Eastern Time (US & Canada)").to_formatted_s(:long)
      comment
    end
  end

  def attachments
    stories.select{ |s| s.resource_subtype == 'attachment_added' }.map do |s|
      attachment_id = s.text.split(/asset_id=/, 2)[1]
      get_attachment(attachment_id)
    end
  end

  # methods

  def resolve
    # task_hash = { completed: true, custom_fields: clear_custom_field_trigger }
    task_hash = { custom_fields: clear_custom_field_trigger }
    # task.update(task_hash)
    asana_client.put("/tasks/#{@task_id}", body: task_hash)
  end

  private

  def clear_custom_field_trigger
    custom_fields = {}
    custom_fields[ENV["ASANA_MI_CF_TRIGGER_ID"]] = ENV["ASANA_MI_CF_TRIGGER_SENT_ID"]
    custom_fields
  end
end
