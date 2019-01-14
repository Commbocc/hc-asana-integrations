class Project
  include AsanaClient

  attr_reader :id, :gid

  def initialize(proj_gid)
    @id = proj_gid
    @gid = proj_gid.to_s
  end

  def name
    project.name
  end

  def team
    get_team(project.team['gid'])
  end

  def cfs
    project.custom_field_settings
  end

  # methods

  def add_department_cfs
    cfids = [ENV["ASANA_PROJS_INC_SERVICE_REPORT_CFID"]]
    cfids << team.description.gsub(/\s+/, '').split(',')

    cfids.flatten!.each do |cfid|
      project.add_custom_field_setting(custom_field: cfid, is_important: false) unless has_cf?(cfid)
    end
  end

  private

  def has_cf?(cfid)
    cfs.map{ |c| c['custom_field']['gid'] }.include? cfid
  end

  def project
    get_project(@gid)
  end
end
