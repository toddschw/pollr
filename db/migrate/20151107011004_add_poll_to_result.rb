class AddPollToResult < ActiveRecord::Migration
  def change
    add_reference :results, :poll, index: true, foreign_key: true
  end
end
