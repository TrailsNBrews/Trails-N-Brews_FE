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
    @name = data[:attributes][:name]
    @street = data[:attributes][:street] ||= "No address on file"
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @postal_code = data[:attributes][:postal_code]
    @longitude = data[:attributes][:longitude]
    @latitude = data[:attributes][:latitude]
    @phone = data[:attributes][:phone] ||= "No phone number on file"
    @website = data[:attributes][:website_url] ||= "No website on file"
  end
  
end