class Trail 
  attr_reader :id,
              :type,
              :name,
              :coordinates,
              :bathrooms

  def initialize(data)
    # binding.pry
    @id = data[:id]
    @type =data[:type]
    @name = data[:attributes][:name]
    @coordinates = data[:attributes][:coordinates]
    @bathrooms = data[:attributes][:bathrooms]
  end
end