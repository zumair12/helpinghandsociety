class MainController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home_page]

  def home_page
    @todays_notices = Notice.todays_notices
  end
end