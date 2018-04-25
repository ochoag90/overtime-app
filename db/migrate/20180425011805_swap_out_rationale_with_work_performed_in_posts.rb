class SwapOutRationaleWithWorkPerformedInPosts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :posts, :worked_performed, :work_performed
  end
end
