require 'asana'

module AsanaClient
  extend ActiveSupport::Concern

  class_methods do
    # def Authenticate
    #   # OAuth
    # end

    def asana_client
      Asana::Client.new do |c|
        c.authentication :access_token, token
      end
    end

    private

    def token
      user = OpenStruct.new(token: ENV["ASANA_MI_ACCESS_TOKEN"])
      user.token || ENV["ASANA_MI_ACCESS_TOKEN"]
    end
  end

  included do
    private

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

    def get_project(id)
      asana_client.projects.find_by_id(id)
    end

    def get_team(id)
      asana_client.teams.find_by_id(id, options: { expand: :description })
    end

    def get_custom_field(id)
      asana_client.custom_fields.find_by_id(id)
    end
  end
end
