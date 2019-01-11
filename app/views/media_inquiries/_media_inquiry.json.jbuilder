json.task media_inquiry.task, :id, :name, :notes

json.assignee media_inquiry.assignee, :id, :name, :email

json.comments media_inquiry.comments, :id, :created_at, :created_by, :text

json.attachments media_inquiry.attachments, :id, :created_at, :name, :download_url

json.html_body render(partial: 'media_inquiry.html.erb', locals: { media_inquiry: media_inquiry }).squish
