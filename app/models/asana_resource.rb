class AsanaResource
  include AsanaClient

  attr_reader :gid

  def initialize(gid: nil)
    @gid = gid.to_s || nil
  end
end
