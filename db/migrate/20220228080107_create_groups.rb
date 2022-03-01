class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name # 人员组名字
      t.string :dn # AD区分名

      t.timestamps
    end
  end
end
