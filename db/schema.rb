# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120216181400) do

  create_table "answers", :force => true do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.integer  "question_id"
    t.integer  "choice_id"
    t.integer  "user_id"
    t.integer  "saved_position"
    t.text     "answer_data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id"
    t.integer  "code_id"
  end

  add_index "answers", ["choice_id"], :name => "index_answers_on_choice_id"
  add_index "answers", ["code_id"], :name => "index_answers_on_code_id"
  add_index "answers", ["group_id"], :name => "index_answers_on_group_id"
  add_index "answers", ["project_id"], :name => "index_answers_on_project_id"
  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["saved_position"], :name => "index_answers_on_saved_position"
  add_index "answers", ["session_id"], :name => "index_answers_on_session_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "branches", :force => true do |t|
    t.integer  "project_id"
    t.integer  "question_id"
    t.integer  "group_id"
    t.integer  "choice_id"
    t.integer  "destination_group_id"
    t.integer  "return_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branches", ["choice_id"], :name => "index_branches_on_choice_id"
  add_index "branches", ["destination_group_id"], :name => "index_branches_on_destination_group_id"
  add_index "branches", ["group_id"], :name => "index_branches_on_group_id"
  add_index "branches", ["project_id"], :name => "index_branches_on_project_id"
  add_index "branches", ["question_id"], :name => "index_branches_on_question_id"
  add_index "branches", ["return_group_id"], :name => "index_branches_on_return_group_id"

  create_table "choices", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "choices", ["active"], :name => "index_choices_on_active"
  add_index "choices", ["id"], :name => "index_choices_on_id", :unique => true
  add_index "choices", ["output_text"], :name => "index_choices_on_output_text", :length => {"output_text"=>"255"}
  add_index "choices", ["title"], :name => "index_choices_on_title"
  add_index "choices", ["user_id"], :name => "index_choices_on_user_id"

  create_table "codes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "session_id", :limit => 1024
    t.string   "code",       :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",                  :default => false
    t.text     "meta"
  end

  add_index "codes", ["code"], :name => "index_codes_on_code", :length => {"code"=>"255"}
  add_index "codes", ["completed"], :name => "index_codes_on_completed"
  add_index "codes", ["project_id"], :name => "index_codes_on_project_id"
  add_index "codes", ["session_id"], :name => "index_codes_on_session_id", :length => {"session_id"=>"255"}
  add_index "codes", ["user_id"], :name => "index_codes_on_user_id"

  create_table "group_items", :force => true do |t|
    t.integer  "group_id"
    t.integer  "question_id"
    t.text     "description"
    t.boolean  "required"
    t.integer  "position"
    t.integer  "user_id"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "group_items", ["active"], :name => "index_group_items_on_active"
  add_index "group_items", ["group_id"], :name => "index_group_items_on_group_id"
  add_index "group_items", ["position"], :name => "index_group_items_on_position"
  add_index "group_items", ["question_id"], :name => "index_group_items_on_question_id"
  add_index "group_items", ["user_id"], :name => "index_group_items_on_user_id"

  create_table "groups", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "groups", ["active"], :name => "index_groups_on_active"
  add_index "groups", ["user_id"], :name => "index_groups_on_user_id"

  create_table "project_items", :force => true do |t|
    t.integer  "project_id"
    t.integer  "group_id"
    t.text     "description"
    t.integer  "position"
    t.string   "type"
    t.integer  "user_id"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_items", ["active"], :name => "index_project_items_on_active"
  add_index "project_items", ["group_id"], :name => "index_project_items_on_group_id"
  add_index "project_items", ["position"], :name => "index_project_items_on_position"
  add_index "project_items", ["project_id"], :name => "index_project_items_on_project_id"
  add_index "project_items", ["type"], :name => "index_project_items_on_type"
  add_index "project_items", ["user_id"], :name => "index_project_items_on_user_id"

  create_table "project_styles", :force => true do |t|
    t.integer  "project_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_styles", ["project_id"], :name => "index_project_styles_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta"
  end

  add_index "projects", ["active"], :name => "index_projects_on_active"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "question_items", :force => true do |t|
    t.integer  "question_id"
    t.integer  "choice_id"
    t.text     "description"
    t.integer  "position"
    t.integer  "user_id"
    t.boolean  "active",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_items", ["active"], :name => "index_question_items_on_active"
  add_index "question_items", ["choice_id"], :name => "index_question_items_on_choice_id"
  add_index "question_items", ["position"], :name => "index_question_items_on_position"
  add_index "question_items", ["question_id"], :name => "index_question_items_on_question_id"
  add_index "question_items", ["user_id"], :name => "index_question_items_on_user_id"

  create_table "question_types", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_types", ["active"], :name => "index_question_types_on_active"
  add_index "question_types", ["user_id"], :name => "index_question_types_on_user_id"

  create_table "questions", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.string   "type"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "meta"
  end

  add_index "questions", ["active"], :name => "index_questions_on_active"
  add_index "questions", ["type"], :name => "index_questions_on_type"
  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "reports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name",              :limit => 40
    t.string   "authorizable_type", :limit => 40
    t.integer  "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["authorizable_id"], :name => "index_roles_on_authorizable_id"
  add_index "roles", ["authorizable_type"], :name => "index_roles_on_authorizable_type"

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "target_list_items", :force => true do |t|
    t.integer  "target_list_id"
    t.integer  "target_id"
    t.text     "description"
    t.text     "notes"
    t.integer  "position"
    t.integer  "user_id"
    t.boolean  "active",         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_list_items", ["active"], :name => "index_target_list_items_on_active"
  add_index "target_list_items", ["position"], :name => "index_target_list_items_on_position"
  add_index "target_list_items", ["target_id"], :name => "index_target_list_items_on_target_id"
  add_index "target_list_items", ["target_list_id"], :name => "index_target_list_items_on_target_list_id"
  add_index "target_list_items", ["user_id"], :name => "index_target_list_items_on_user_id"

  create_table "target_lists", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.text     "notes"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_lists", ["active"], :name => "index_target_lists_on_active"
  add_index "target_lists", ["user_id"], :name => "index_target_lists_on_user_id"

  create_table "target_types", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "target_types", ["active"], :name => "index_target_types_on_active"
  add_index "target_types", ["user_id"], :name => "index_target_types_on_user_id"

  create_table "targets", :force => true do |t|
    t.string   "title",                                         :null => false
    t.string   "output_text", :limit => 1024
    t.text     "description"
    t.text     "notes"
    t.text     "content"
    t.integer  "user_id"
    t.string   "type"
    t.boolean  "active",                      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "targets", ["active"], :name => "index_targets_on_active"
  add_index "targets", ["type"], :name => "index_targets_on_type"
  add_index "targets", ["user_id"], :name => "index_targets_on_user_id"

  create_table "user_locks", :force => true do |t|
    t.integer  "user_id"
    t.string   "user_anonymous_string"
    t.integer  "project_id"
    t.integer  "group_id"
    t.boolean  "completed",             :default => false
    t.text     "user_meta"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id"
    t.integer  "code_id"
  end

  add_index "user_locks", ["code_id"], :name => "index_user_locks_on_code_id"
  add_index "user_locks", ["completed"], :name => "index_user_locks_on_completed"
  add_index "user_locks", ["created_at"], :name => "index_user_locks_on_created_at"
  add_index "user_locks", ["group_id"], :name => "index_user_locks_on_group_id"
  add_index "user_locks", ["project_id"], :name => "index_user_locks_on_project_id"
  add_index "user_locks", ["session_id"], :name => "index_user_locks_on_session_id"
  add_index "user_locks", ["type"], :name => "index_user_locks_on_type"
  add_index "user_locks", ["updated_at"], :name => "index_user_locks_on_updated_at"
  add_index "user_locks", ["user_id"], :name => "index_user_locks_on_user_id"

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                             :null => false
    t.integer  "login_count",                    :default => 0, :null => false
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.integer  "allow_login",       :limit => 1, :default => 1, :null => false
  end

  add_index "users", ["allow_login"], :name => "index_users_on_allow_login"
  add_index "users", ["created_at"], :name => "index_users_on_created_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["oauth_token"], :name => "index_users_on_oauth_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["updated_at"], :name => "index_users_on_updated_at"

end
