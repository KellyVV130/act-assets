class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name # 姓名
      t.string :english_name # 英文名
      t.string :tel # 电话
      t.string :email # 邮箱
      t.string :account # 统一认证帐户
      t.string :grade # 年级，非必填
      t.string :status # 身份
      # 组名， 导师， 工位， 研究领域， 导师名字

      t.timestamps
    end
  end
end
