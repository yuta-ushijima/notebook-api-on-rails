class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

   def attributes(*args)
    h = super(*args)
    # h[:birthday] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthday] =  object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
