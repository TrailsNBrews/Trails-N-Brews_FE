class Brewery

  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :postal_code,
              :longitude,
              :latitude,
              :phone,
              :website

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @postal_code = data[:postal_code]
    @longitude = data[:longitude]
    @latitude = data[:latitude]
    @phone = data[:phone]
    @website = data[:website_url]
  end
  
end