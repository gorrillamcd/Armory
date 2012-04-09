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

ActiveRecord::Schema.define(:version => 20120408234000) do

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
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "exams", ["course_id"], :name => "index_exams_on_course_id"

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

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.integer  "lesson_id"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "questions", ["exam_id"], :name => "index_questions_on_exam_id"
  add_index "questions", ["lesson_id"], :name => "index_questions_on_lesson_id"

end
