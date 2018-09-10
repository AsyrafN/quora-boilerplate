
class CreateAnswer < ActiveRecord::Migration[5.0]

  def change
  	create_table :answers do |t|

      t.string :answer
      t.belongs_to :user
      t.belongs_to :question
      t.timestamps

     end

  end

end

