class Contact < ApplicationRecord
  
  # モデル同士の関連付け
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  # def as_json(options={})
  #   h = super(options)
  #   h[:birthday] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   h
  # end
  # def birthdate_ja
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  # def to_ja
  #   { name: self.name,
  #     email: self.email, 
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?)
  #   }
  # end
  # def author
  #   "Yuta Ushijima"
  # end

  # def kind_description
  #   # 表示される形式が異なるだけで、やっているのは以下と一緒
  #   # include: { kind: { only: :description }}
  #   self.kind.description
  # end

  # def as_json(options={})
  #   # superにより、controllerでContactモデルが呼び出される際にas_json実行。
  #   super(
  #     root: true,
  #     methods: [:kind_description, :author, ],
  #     # includeを使って、ハッシュ形式でkindモデルの情報を渡す。
  #     # onlyを使えば表示するキー(カラム)の絞り込みが可能
  #     # include: { kind: { only: :description }}
  #     # ただし、冗長なのでmethodsオプションで指定するのが慣例
  #     )
  # end

  # def hello
  #   I18n.t('hello')
  # end

  # def I18n
  #   I18n.default_locale
  # end
end
