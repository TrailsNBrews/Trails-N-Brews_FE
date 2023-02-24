class Brewery

  attr_reader :name,
              :street,
              :city,
              :state,
              :postal_code,
              :longitude,
              :latitude,
              :phone

  def initialize(data)
    @name = data[:name]
    @street = data[:street]
    @city = data[:city]
    @state = data[:state]
    @postal_code = data[:postal_code]
    @longitude = data[:longitude]
    @latitude = data[:latitude]
    @phone = data[:phone]
  end
  
end