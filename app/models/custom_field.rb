class CustomField < AsanaResource
  # class methods
  def self.all
    cfs = asana_client.custom_fields.find_by_workspace(workspace: ENV['ASANA_WORKSPACE_ID'])
    cfs.sort_by(&:name).map{ |cf| self.new(cf: cf) }
  end

  attr_reader :name

  def initialize(id: nil, cf: nil)
    super(id: cf.present? ? cf.id : id)
    _cf = cf.present? ? cf : custom_field
    @name = _cf.name
  end

  private

  def custom_field
    get_custom_field(@gid)
  end
end
