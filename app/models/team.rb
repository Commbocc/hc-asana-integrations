class Team < AsanaResource
  attr_reader :name, :description

  def initialize(gid: nil)
    super(gid: gid)
    @name = team.name
    @description = team.description
  end

  private

  def team
    get_team(@gid)
  end
end
