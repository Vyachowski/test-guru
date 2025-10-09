class AddTimeLimitToTestsAndAddTimedOutToTestPassages < ActiveRecord::Migration[7.2]
  def change
    add_column :tests, :timer, :integer, comment: 'Time to complete the test in minutes (nil - unlimited)'

    add_column :test_passages, :timed_out, :boolean, default: false, null: false, comment: 'Flag that the test completed due to timeout'
  end
end
