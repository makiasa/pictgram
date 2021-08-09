class PagesController < ApplicationController
  before_action :login_check, except: [:index]
  def index
  end
  
  def help
  end
  
  def link
  end
end
