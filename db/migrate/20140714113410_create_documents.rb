class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.references :docable, polymorphic: true
      t.string :file
      t.timestamps
    end
  end
end
