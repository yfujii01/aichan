# frozen_string_literal: true

class CreateTalkTables < ActiveRecord::Migration[5.2]
  def change
    create_table :talk_tables do |t|
      t.string :input
      t.string :message
      t.string :tag

      t.timestamps
    end
  end
end
