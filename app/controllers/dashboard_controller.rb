class DashboardController < ApplicationController
  layout "dashboard"
  before_action :authenticate_user!
  skip_after_action :verify_authorized

  def index
    nextup = [{title: "Ship project 1", time:Time.new(2026, 1, 6, 21)}, {title: "Ship project 2", time:Time.new(2026, 1, 8, 10)}]
    @next_event = nextup.min_by { |event| event[:time] }

  end
end
