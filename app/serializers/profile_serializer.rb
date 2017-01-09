class ProfileSerializer < ActiveModel::Serializer
    attributes :id, :name, :phone, :address, :picture, :about, :riding_level
end