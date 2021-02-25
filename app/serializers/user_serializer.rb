class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :name
  has_many :trips, serializer: TripSerializer
end
