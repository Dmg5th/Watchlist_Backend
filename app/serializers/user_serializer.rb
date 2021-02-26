class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :name
  has_many :user_movies, serializer: UserMoviesSerializer
end
 