namespace :dev do
  desc "開発環境設定"
  task setup: :environment do

    puts "説明文のダミーデータ生成中..."

    kinds = %w(Goodmorning! Hello! Goodbye!)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end
    puts "説明文のダミーデータ登録完了！"

    ################################

    puts "Contactテーブルのダミーデータ生成中..."
    100.times do |generate|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(65.days.ago, 18.years.ago),
        kind: Kind.all.sample
       )
    end
    puts "Contactテーブルのダミーデータ登録完了！"

    ################################

    puts "Phoneテーブルのダミーデータ生成中..."
    Contact.all.each do |contact|
      Random.rand(5).times do |i|
        phone = Phone.create(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Phoneテーブルのダミーデータ登録完了！"

    
  end
end