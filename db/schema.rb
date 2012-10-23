# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121023012200) do

  create_table "answers", :force => true do |t|
    t.string   "text"
    t.boolean  "correct"
    t.integer  "question_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "books", :force => true do |t|
    t.string   "isbn"
    t.string   "name"
    t.boolean  "required"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "books", ["course_id"], :name => "index_books_on_course_id"

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "teacher"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "identifier"
    t.integer  "credits"
  end

  create_table "exams", :force => true do |t|
    t.string   "kind"
    t.integer  "weight"
    t.integer  "lesson_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "exams", ["lesson_id"], :name => "index_exams_on_lesson_id"

  create_table "grades", :force => true do |t|
    t.integer  "average_grade"
    t.integer  "subscription_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "exam_id"
  end

  add_index "grades", ["exam_id"], :name => "index_grades_on_exam_id"
  add_index "grades", ["subscription_id"], :name => "index_grades_on_subscription_id"

  create_table "lessons", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "teaching_file_name"
    t.string   "teaching_content_type"
    t.integer  "teaching_file_size"
    t.datetime "teaching_updated_at"
  end

  add_index "lessons", ["course_id"], :name => "index_lessons_on_course_id"

  create_table "payments", :force => true do |t|
    t.integer  "amount"
    t.string   "kind"
    t.datetime "completed_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "payments", ["completed_at"], :name => "index_payments_on_completed_at"

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "exam_id"
  end

  add_index "questions", ["exam_id"], :name => "index_questions_on_exam_id"

  create_table "subscriptions", :force => true do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.string   "state",      :default => "pending"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "payment_id"
  end

  add_index "subscriptions", ["course_id"], :name => "index_subscriptions_on_course_id"
  add_index "subscriptions", ["payment_id"], :name => "index_subscriptions_on_payment_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",        :null => false
    t.string   "encrypted_password",     :default => "",        :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "role",                   :default => "student"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
