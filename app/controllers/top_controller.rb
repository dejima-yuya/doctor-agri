class TopController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :check_admin, except: %i(index)

  def index
  end

  def sub
  end

end
