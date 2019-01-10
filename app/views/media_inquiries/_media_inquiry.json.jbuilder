json.task media_inquiry.task, :id, :name, :notes

json.assignee media_inquiry.assignee, :id, :name, :email

json.comments media_inquiry.comments, :id, :created_at, :created_by, :text

json.attachments media_inquiry.attachments, :id, :created_at, :name, :view_url
