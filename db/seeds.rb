# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
# csvファイルを扱うためのgemを読み込む

CSV.foreach('db/Exposer_acount.csv') do |row|
  # foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
  # rowには、読み込まれた行が代入される

  User.create(name: row[0], email: row[1], user_text: row[2], image_name: row[3], password_digest: row[4])
  # usersテーブルの各カラムに、各行のn番目の値を代入している。
end
