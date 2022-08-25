class Notice
  attr_accessor :name, :message, :alert

  def initialize(params = {})
    @name = params[:name]
    @message = params[:message]
    @alert = params[:alert]
  end

  def self.create(name, message, alert = "info")
    Notice.new(name:, message:, alert:)
  end


  def self.todays_notices
    notices = []
    registered_count = Student.registered.count
    notices << create(Info.mam_name, "#{registered_count} applications are in list.") if registered_count.positive?
    registered_count = Student.approved.count
    notices << create("Approved Students", "#{registered_count} students are approved", "warning") if registered_count.positive?
  end
end