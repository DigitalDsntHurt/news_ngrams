class CreateUrlQueues < ActiveRecord::Migration[5.0]
  def change
    create_table :url_queues do |t|
      t.date :date_added_to_queue
      t.string :publication
      t.string :url
      t.date :date_scraped

      t.timestamps
    end
  end
end
