class CustomField
  include AsanaClient

  def self.all
    cfs = asana_client.custom_fields.find_by_workspace(workspace: ENV['ASANA_WORKSPACE_ID'])
    cfs.sort_by(&:name).map{ |cf| self.new(cf) }
  end

  attr_reader :id, :gid, :name

  def initialize(cf)
    @id = cf.id
    @gid = cf.gid
    @name = cf.name
  end
end
