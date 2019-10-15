json.task media_inquiry.task, :gid, :name, :notes

json.assignee media_inquiry.assignee, :gid, :name, :email

json.comments media_inquiry.comments, :gid, :created_at, :created_by, :text

json.attachments media_inquiry.attachments, :gid, :created_at, :name, :download_url

json.html_body render(partial: 'media_inquiry.html.erb', locals: { media_inquiry: media_inquiry }).squish
