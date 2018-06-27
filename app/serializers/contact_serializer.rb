class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  # モデル同士の関連付け
  belongs_to :kind
  has_many :phones
  has_one :address

  def attributes(*args)
    h = super(*args)
    # h[:birthday] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthday] =  object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
