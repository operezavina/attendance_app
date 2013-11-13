class EventsController < ActionController::Base
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :admin_user,     only: [:destroy]
  def index
    if !params[:user].nil?
    @events = Event.where(user_id:params[:user][:user_id]).paginate(page: params[:page]).order(:start_time)
        respond_to do |format|
        format.html
        format.csv { render text: @events.to_csv }
        format.xls
        end
    else
      @events = Event.order(:start_time).paginate(page: params[:page])
      respond_to do |format|
        format.html
        format.csv { render text: @events.to_csv }
        format.xls

      end
    end
  end
  def new
    @event = Event.new
  end
  def edit
    @event = Event.find params[:id]
  end
  def create

  end
  def update
    respond_to do |format|
      if @event.update(event_params)
        @event.project_id = params[:project][:project_id]
        @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
     end
  end

  def show
  end
  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event destroyed."
    redirect_to admin_path
  end
  private
  def event_params
    params.require(:event).permit(:name,:start_time,:end_time,:project_id)
  end
  def set_event
    @event = Event.find(params[:id])
  end
  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  def admin_user
    redirect_to(@current_user) unless current_user.admin?
  end
end