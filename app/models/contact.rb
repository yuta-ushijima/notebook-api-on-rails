class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Yuta Ushijima"
  end

  def kind_description
    # 表示される形式が異なるだけで、やっているのは以下と一緒
    # include: { kind: { only: :description }}
    self.kind.description
  end

  def as_json(options={})
    # superにより、controllerでContactモデルが呼び出される際にas_json実行。
    super(
      root: true,
      methods: [:kind_description, :author, ] 
      # includeを使って、ハッシュ形式でkindモデルの情報を渡す。
      # onlyを使えば表示するキー(カラム)の絞り込みが可能
      # include: { kind: { only: :description }}
      # ただし、冗長なのでmethodsオプションで指定するのが慣例
      )
  end
end
