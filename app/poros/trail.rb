class Trail 
  attr_reader :id,
              :type,
              :name,
              :latitude,
              :longitude,
              :bathrooms,
              :co_id

  def initialize(data)
    @id = data[:id]
    @type =data[:type]
    @name = data[:attributes][:name]
    @latitude = data[:attributes][:latitude]
    @longitude = data[:attributes][:longitude]
    @bathrooms = data[:attributes][:bathrooms]
    @co_id = data[:co_id]
  end
end