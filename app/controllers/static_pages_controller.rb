class StaticPagesController < ApplicationController
  def index
    redirect_to 'https://www.hillsboroughcounty.org/'
  end
end
