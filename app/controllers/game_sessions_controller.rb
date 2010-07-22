class GameSessionsController < ApplicationController
  respond_to :html
  layout :pick_layout
  
  def pick_layout
    params[:action] == "new" ? nil : 'application'
  end
  
  def index
    @sessions = GameSession.order('started_at DESC').where(['started_at > ?', 30.days.ago])
    
    respond_with(@sessions)
  end
  
  def new
    @session = GameSession.new
    
    respond_with(@session)
  end
  
  def create
    @session = GameSession.create(params[:game_session])
    
    respond_with(@session)    
  end
end
