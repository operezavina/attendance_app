class StaticPagesController < ApplicationController
  def home
   #if signed_in?
      @events = Event.all
      @events_time = Event.select("id,start_time,end_time,user_id").order("user_id")
   #end
  end


  def help
  end

  def about
  end

  def _contact

  end
end