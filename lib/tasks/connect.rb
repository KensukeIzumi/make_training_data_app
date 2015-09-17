require 'mysql'

connection = Mysql::connect("localhost", "root", "Gogotiroru1", "make_training_data_app_development")

# 文字コードをUTF8に設定
connection.query("set character set utf8")

# DBに問い合わせ
rs = connection.query("SELECT * FROM prepared_images")

# 検索結果を表示
rs.each do |r|
puts r.join ", "
end

# コネクションを閉じる
connection.close


