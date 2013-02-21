class AddIndexes < ActiveRecord::Migration
  def self.up
    indexes_to_add = {
      :answers => [:choice_id, :user_id, :saved_position, :session_id],
      :choices => [:user_id],
      :codes => [:user_id, :project_id, :session_id, :code, :completed],
      :group_items => [:position, :user_id, :active],
      :groups => [:user_id, :active],
      :project_items => [:position, :type, :user_id, :active],
      :project_styles => [:project_id],
      :projects => [:user_id, :active],
      :question_items => [:position, :user_id, :active],
      :question_types => [:user_id, :active],
      :questions => [:type, :user_id, :active],
      :roles => [:authorizable_type, :authorizable_id],
      :roles_users => [:user_id, :role_id],
      :target_list_items => [:position, :user_id, :active],
      :target_lists => [:user_id, :active],
      :target_types => [:user_id, :active],
      :targets => [:user_id, :type, :active],
      :user_locks => [:created_at, :updated_at, :user_id, :project_id, :group_id, :completed, :type, :session_id, :code_id],
      :users => [:created_at, :updated_at, :allow_login]
    }

    indexes_to_add.keys.each do|t|
      indexes_to_add[t].each do |col|
        add_index t, col
      end
    end

  end

  def self.down
    indexes_to_remove = {
      :answers => [:choice_id, :user_id, :saved_position, :session_id],
      :choices => [:user_id],
      :codes => [:user_id, :project_id, :session_id, :code, :completed],
      :group_items => [:position, :user_id, :active],
      :groups => [:user_id, :active],
      :project_items => [:position, :type, :user_id, :active],
      :project_styles => [:project_id],
      :projects => [:user_id, :active],
      :question_items => [:position, :user_id, :active],
      :question_types => [:user_id, :active],
      :questions => [:type, :user_id, :active],
      :roles => [:authorizable_type, :authorizable_id],
      :roles_users => [:user_id, :role_id],
      :target_list_items => [:position, :user_id, :active],
      :target_lists => [:user_id, :active],
      :target_types => [:user_id, :active],
      :targets => [:user_id, :type, :active],
      :user_locks => [:created_at, :updated_at, :user_id, :project_id, :group_id, :completed, :type, :session_id, :code_id],
      :users => [:created_at, :updated_at, :allow_login]
    }

    indexes_to_remove.keys.each do|t|
      indexes_to_remove[t].each do |col|
        remove_index t, col
      end
    end
  end
end
