class UserSerializer < ActiveModel::Serializer
  def self.serialize(user)
    serialized_user = '{'
    serialized_user += '"id": ' + user.id.to_s + ', '
    serialized_user += '"email": "' + user.email + '"'
    serialized_user += '}'
  end
end
