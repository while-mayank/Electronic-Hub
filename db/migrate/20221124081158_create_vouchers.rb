class CreateVouchers < ActiveRecord::Migration[6.1]
  def change
    create_table :vouchers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :payment_detail, null: false, foreign_key: true
      t.bigint :amount

      t.timestamps
    end
  end
end
