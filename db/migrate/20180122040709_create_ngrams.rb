class CreateNgrams < ActiveRecord::Migration[5.0]
  def change
    create_table :ngrams do |t|
      t.date :date
      t.string :n
      t.string :terms
      t.integer :occurrences

      t.timestamps
    end
  end
end
