class CreatePrototypes < ActiveRecord::Migration[6.0]
  def change
    create_table :prototypes do |t|
      t.string :title,     null:false
      t.text  :cath_copy,  null:false
      t.text  :concept,    null:false
      t.references :user,   null:false, foreign_kei: true
      t.timestamps
    end
  end
end
