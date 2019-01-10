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
      get_user(task.assignee['id'])
    else
      OpenStruct.new(email: ENV["ASANA_MI_DEFAULT_EMAIL_TO"])
    end
  end

  def comments
    task.stories.select{ |s| s.resource_subtype == 'comment_added' }.map do |s|
      os = OpenStruct.new(s.to_h)
      os.created_at = s.created_at.to_datetime.in_time_zone("Eastern Time (US & Canada)").to_formatted_s(:long)
      os
    end
  end

  def attachments
    task.stories.select{ |s| s.resource_subtype == 'attachment_added' }.map do |s|
      attachment_id = s.text.split(/asset_id=/, 2)[1]
      get_attachment(attachment_id)
    end
  end

  # methods

  def clear_custom_field_trigger
    hash = {}
    hash[ENV["ASANA_MI_CF_TRIGGER_ID"]] = ENV["ASANA_MI_CF_TRIGGER_SENT_ID"]
    task.update(custom_fields: hash)
  end
end
