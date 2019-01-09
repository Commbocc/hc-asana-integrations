require 'asana'

module AsanaClient
  extend ActiveSupport::Concern

  class_methods do
    def asana_client
      Asana::Client.new do |c|
        c.authentication :access_token, ENV["ASANA_MI_ACCESS_TOKEN"]
      end
    end
  end

  included do
    def asana_client
      self.class.asana_client
    end

    def get_task(id)
      asana_client.tasks.find_by_id(id)
    end

    def get_user(id)
      asana_client.users.find_by_id(id)
    end

    def get_story(id)
      asana_client.stories.find_by_id(id)
    end

    def get_attachment(id)
      asana_client.attachments.find_by_id(id)
    end
  end
end
