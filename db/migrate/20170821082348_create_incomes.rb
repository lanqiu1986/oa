class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|

      t.timestamps
    end
  end
end
