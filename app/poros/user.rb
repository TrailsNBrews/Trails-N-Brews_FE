class User

  attr_reader :id,
              :first_name,
              :last_name,
              :email,
              :google_id,
              :google_token

  def initialize(data)
    @id = data[0][:id]
    @first_name = data[0][:attributes][:first_name]
    @last_name = data[0][:attributes][:last_name]
    @email = data[0][:attributes][:email]
    @google_id = data[0][:attributes][:google_id]
    @google_token = data[0][:attributes][:google_token]
  end
end
