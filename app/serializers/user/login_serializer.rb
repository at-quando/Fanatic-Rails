class User::LoginSerializer < UserSerializer
  attributes :name, :phone, :address, :gender, :avatar
end
