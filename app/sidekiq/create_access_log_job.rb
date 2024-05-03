class CreateAccessLogJob
  include Sidekiq::Job

  def perform(options)
    options["country_name"] = get_country_name(options["ip_address"])
    AccessLog.create(options)
    puts "Access Logs Created successfully"
  end

  private
  def get_country_name(ip_address)
    ip_address="49.156.110.237" if Rails.env === 'development'
    country_name = "BD"
    location_data = Geocoder.search(ip_address)
    if location_data.present?
      country_name = location_data.try(:first).try(:country)
    end
    country_name
  end
end
