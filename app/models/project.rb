class Project < AsanaResource
  attr_reader :name, :team, :custom_fields

  def initialize(id: nil)
    super(id: id)
    @name = project.name
    @team = Team.new(id: project.team['gid'])
    @custom_fields = project.custom_field_settings
  rescue
    nil
  end

  # methods

  def add_department_cfs
    cfids = [ENV["ASANA_PROJS_INC_SERVICE_REPORT_CFID"]]
    cfids << @team.description.gsub(/\s+/, '').split(',')
    cfids.flatten!.each do |cfid|
      begin
        project.add_custom_field_setting(custom_field: cfid, is_important: false) unless has_cf?(cfid)
      rescue
        break
      end
    end
  rescue
    false
  end

  private

  def project
    get_project(@gid)
  end

  def has_cf?(cfid)
    @custom_fields.map{ |c| c['custom_field']['gid'] }.include? cfid
  end
end
