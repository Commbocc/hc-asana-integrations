class CustomField < AsanaResource
  # class methods
  def self.all
    cfs = asana_client.custom_fields.find_by_workspace(workspace: ENV['ASANA_WORKSPACE_ID'])
    cfs.sort_by(&:name).map{ |cf| self.new(cf: cf) }
  end

  attr_reader :name

  def initialize(gid: nil, cf: nil)
    super(gid: cf.present? ? cf.gid : gid)
    _cf = cf.present? ? cf : custom_field
    @name = _cf.name
  end

  private

  def custom_field
    get_custom_field(@gid)
  end
end
