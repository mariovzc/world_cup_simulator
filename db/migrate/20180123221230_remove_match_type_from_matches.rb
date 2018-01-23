class RemoveMatchTypeFromMatches < ActiveRecord::Migration[5.1]
  def change
    remove_column :matches, :match_type_id, :integer

  end
end
