class User::LoginSerializer < UserSerializer
  attributes :id, :name, :phone, :address, :gender, :avatar
end
