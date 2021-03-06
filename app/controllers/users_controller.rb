class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @teams = Team.all
    @first_user = User.first
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @teams = Team.all
    @team = Team.new
  end

  # GET /users/1/edit
  def edit
    @team = @user.team
    @teams = Team.all
  end

  # POST /users
  # POST /users.json
  def create
    @teams = Team.all
    #debugging
    # @a = user_params.inspect
    # @b = team_params.inspect
    # @c = params

    # create a new user
    @user = User.new user_params

    # determine if team has been passed in
    if team_params[:id]
      # if field exists, a team exists
      # update the team
      @team = Team.find team_params[:id]
    else
      # create a new team
      @team = Team.new team_params
    end

    # assign user's team to either the exising team or a new team
    @user.team = @team

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @teams = Team.all

    # update user attributes
    @user.name = user_params[:name]
    @user.username = user_params[:username]

    # set values for team model
    if team_params[:id]
      # if field exists, a team exists
      # update the team
      @team = Team.find team_params[:id]
    else
      # new team
      @team = Team.new team_params
    end

    # update team model
    @user.team = @team


    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def dashboard
    @user = User.find_by username: params[:username]
    @team = @user.team
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # def set_team
    #   @team_selected = Team.find(:all, :params => )
    # end

    def team_params
      params.require(:team).permit(:id, :name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :team_id, :username)
    end
end
