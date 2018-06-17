class Contact < ApplicationRecord

  def author
    "Yuta Ushijima"
  end

  def as_json(options={})
    # superにより、controllerでContactモデルが呼び出される際にas_json実行。
    super(methods: :author, root: true)
  end
end
