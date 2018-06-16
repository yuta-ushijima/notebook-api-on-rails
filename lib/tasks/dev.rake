namespace :dev do
  desc "開発環境設定"
  task setup: :environment do
    puts "Contactテーブルのダミーデータ生成中..."
    100.times do |generate|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.days.ago, 18.years.ago)
      )
    end
    puts "Contactテーブルのダミーデータ登録完了！"
  end
end