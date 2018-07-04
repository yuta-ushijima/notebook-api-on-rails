class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  # モデル同士の関連付け
  belongs_to :kind do
    link(:related) { contact_kind_url(object.kind.id) }
  end

  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end

  has_one :address  do
    link(:related) { contact_address_url(object.id) }
  end

  link(:self) { contact_url(object.id) }
  link(:kind) { kind_url(object.kind.id) }
  

  # def author
  #   "ウェブ系ウシジマくん"
  # end

  # meta do
  #   { author: "ウェブ系ウシジマくん" }
  # end


  def attributes(*args)
    h = super(*args)
    # h[:birthday] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthday] =  object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end
