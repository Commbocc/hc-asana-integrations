class Team < AsanaResource
  attr_reader :name, :description

  def initialize(id: nil)
    super(id: id)
    @name = team.name
    @description = team.description
  end

  private

  def team
    get_team(@gid)
  end
end
