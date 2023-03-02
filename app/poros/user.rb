class User

  attr_reader :id,
              :first_name,
              :last_name,
              :email,
              :google_id,
              :google_token

  def initialize(data)
    @id = data[:id]
    
    @first_name = data[:attributes][:first_name]
    @last_name = data[:attributes][:last_name]
    @email = data[:attributes][:email]
    @google_id = data[:attributes][:google_id]
    @google_token = data[:attributes][:google_token]
  end
end
