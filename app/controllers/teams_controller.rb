class TeamsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized


  def join
    if request.post?
      team = Team.find_by(pairing_code: params[:team_code])

      if team
        session[:team_id] = team.id
        redirect_to teams_path, notice: "Successfully joined team!"
      else
        redirect_to action: :join, alert: "Invalid team code"
      end
    end
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      session[:team_id] = @team.id
      redirect_to teams_path, notice: "Team created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    unless user_in_team?
      redirect_to join_teams_path
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
