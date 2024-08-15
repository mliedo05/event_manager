# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_240_810_014_837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: :cascade do |t|
    t.text 'content'
    t.bigint 'user_id', null: false
    t.string 'commentable_type', null: false
    t.bigint 'commentable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[commentable_type commentable_id], name: 'index_comments_on_commentable'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'events', force: :cascade do |t|
    t.string 'title'
    t.datetime 'start_time', precision: nil
    t.datetime 'end_time', precision: nil
    t.boolean 'is_paid', default: false
    t.boolean 'is_remote', default: false
    t.integer 'status', default: 0
    t.string 'address'
    t.integer 'capacity'
    t.float 'price', default: 0.0
    t.text 'internal_note'
    t.string 'description'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'payments', force: :cascade do |t|
    t.integer 'amount'
    t.integer 'status'
    t.string 'payment_method'
    t.string 'transaction_id'
    t.bigint 'reservation_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['reservation_id'], name: 'index_payments_on_reservation_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.text 'content'
    t.string 'image'
    t.bigint 'event_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_posts_on_event_id'
    t.index ['user_id'], name: 'index_posts_on_user_id'
  end

  create_table 'reservations', force: :cascade do |t|
    t.integer 'status', default: 0
    t.bigint 'event_id', null: false
    t.bigint 'user_id', null: false
    t.integer 'paid_status', default: 0
    t.integer 'amount', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_reservations_on_event_id'
    t.index ['user_id'], name: 'index_reservations_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'name'
    t.string 'last_name'
    t.string 'phone_number'
    t.date 'date_of_birth'
    t.string 'profile_image'
    t.integer 'role', default: 0
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'comments', 'users'
  add_foreign_key 'events', 'users'
  add_foreign_key 'payments', 'reservations'
  add_foreign_key 'posts', 'events'
  add_foreign_key 'posts', 'users'
  add_foreign_key 'reservations', 'events'
  add_foreign_key 'reservations', 'users'
end
