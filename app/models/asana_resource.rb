class AsanaResource
  include AsanaClient

  attr_reader :id, :gid

  def initialize(id: nil)
    @id = id.to_i || nil
    @gid = id.to_s || nil
  end
end
