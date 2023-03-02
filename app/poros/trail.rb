class Trail 
  attr_reader :id,
              :type,
              :name,
              :latitude,
              :longitude,
              :bathrooms

  def initialize(data)
    @id = data[:id]
    @type =data[:type]
    @name = data[:attributes][:name]
    @latitude = data[:attributes][:latitude]
    @longitude = data[:attributes][:longitude]
    @bathrooms = data[:attributes][:bathrooms]
  end
end