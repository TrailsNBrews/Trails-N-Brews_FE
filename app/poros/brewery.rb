class Brewery

  attr_reader :id,
              :name,
              :street,
              :city,
              :state,
              :postal_code,
              :longitude,
              :latitude,
              # :phone,
              :website

  def initialize(data)
    # binding.pry
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @postal_code = data[:attributes][:postal_code]
    @longitude = data[:attributes][:longitude]
    @latitude = data[:attributes][:latitude]
    # @phone = data[:phone]
    @website = data[:website_url]
  end
  
end