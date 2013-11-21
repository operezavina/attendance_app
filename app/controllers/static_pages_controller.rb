class StaticPagesController < ApplicationController
  def home
   #if signed_in?
      @events = Event.all
      @events_time = Event.select("id,start_time,end_time,user_id").order("user_id")
   #end
      #@users = User.where(name:params[:texto])
      @users = User.where("name LIKE :name OR email LIKE :name",
             {:name => "%#{params[:texto]}%", :name => params[:texto]})
  end


  def help
  end

  def about
  end

  def _contact

  end
end