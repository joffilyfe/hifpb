class Admin::DashboardController < Admin::AdminController
  def index
    @campis = Campus.count
    @courses = Course.count
  end
end
