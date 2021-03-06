class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :item, foreign_key: true
      t.references :invoice, foreign_key: true
      t.bigint :quantity
      t.bigint :unit_price

      t.timestamps
    end
  end
end
