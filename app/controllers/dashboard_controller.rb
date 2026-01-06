class DashboardController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
  end
end
