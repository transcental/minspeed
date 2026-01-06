class TeamsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  helper_method :current_team, :user_in_team?

  def join
    if request.post?
      team = Team.find_by(pairing_code: params[:team_code])

      if team
        TeamUser.find_or_create_by(user_id: current_user.id).update(team_id: team.id)
        redirect_to teams_path, notice: "Successfully joined team!"
      else
        redirect_to action: :join, alert: "Invalid team code"
      end
    end
  end

  def new
    redirect_to teams_path, alert: "You're already in a team" if user_in_team?
    @team = Team.new
  end

  def create
    if user_in_team?
      redirect_to teams_path, alert: "You're already in a team" and return
    end

    @team = Team.new(team_params)
    @team.user_id = current_user.id

    if @team.save
      TeamUser.find_or_create_by(user_id: current_user.id).update(team_id: @team.id)
      redirect_to teams_path, notice: "Team created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @team = current_team
    @notes = Note.where(team_id: @team.id)
    unless user_in_team?
      redirect_to join_teams_path
    end
  end

  def add_note
    if request.post?
      Note.create(note: params[:note], team_id: current_team.id)
      redirect_to teams_path, notice: "Note created!"
    end
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
