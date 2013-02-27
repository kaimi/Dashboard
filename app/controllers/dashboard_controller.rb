class DashboardController < ApplicationController
  caches_page :lists, :expires_in => 15.minutes
  
  def index
  end

  def lists
  end

  def wiki
  end
end
