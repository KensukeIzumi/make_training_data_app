namespace :prepared_image do

desc "generate prepared_image"

task :generate => :environment do

require 'nokogiri'
require 'anemone'
#require 'mysql'
require 'mysql2'
=begin
def save_image(image_resource)
    PreparedImage.remote_image_url = "image_resource"
end

def insert_image(image_resource)
    connection = Mysql::connect("localhost", "root", "Gogotiroru1", "make_training_data_app_development")
    connection.query("set character set utf8")

    prepared_image.remort_image_url = "#{image_resource}"

    result = connection.query("select image from prepared_images order by id desc limit 1")
    result.each do |r|
        connection.query("insert into prepared_images (image_resource) values (#{image_resource}) where image = '#{r}'")
    end
connection.close
end

=end

def insert_image(image_resource)
    client = Mysql2::Client.new(:host => "localhost",:username => "root",:password => "Gogotiroru1",:database =>  "make_training_data_app_development")
    client.query("set character set utf8")

    uploader = ImageUploader.new
    uploader.download! "#{image_resource}"

    prepared_image = PreparedImage.new
    prepared_image.image = uploader
    prepared_image.image_resource = image_resource 

    prepared_image.save
#    result = ActiveRecord::Base.connection.select_all("select image from prepared_images order by id desc limit 1;").to_a

#    result = client.query("select image from prepared_images order by id desc limit 1;")
#   puts result[0]
#   prepared_image.image_resource = image_resource 
#   prepared_image.save

#   result.each do |r|
#    p "insert into prepared_images (image_resource) values (#{image_resource}) where image ='#{r['image']}';"
#        client.query("insert into prepared_images (image_resource) values (#{image_resource}) where image ='#{r['image']}';")
    

client.close

end
=begin
def insert_image(image_resource)
    client = Mysql2::Client.new(:host => "localhost",:username => "root",:password => "Gogotiroru1",:database =>  "make_training_data_app_development")
    client.query("set character set utf8")

    PreparedImage.remote_image_url = "#{image_resource}"

    result = client.query("select image from prepared_images order by id desc limit 1")
    result.each do |r|
        client.query("insert into prepared_images (image_resource) values (#{image_resource}) where image = '#{r}'")
    end
client.close
end
=end

opts = {
    depth_limit: 1
}

Anemone.crawl("http://cookpad.com/search", opts) do |anemone|

    anemone.focus_crawl do |page|
      page.links.keep_if {|link|
        link.to_s.match(
                /http:\/\/cookpad.com\/recipe\/.*/)
      }
    end

    anemone.on_every_page do |page|
        page.doc.xpath("//*[@id='main-photo']/img").each do |node|

    puts 'hoge'
            image_resource = node.attribute('src')
            puts image_resource
#            save_image(image_resource)
            insert_image(image_resource)
        end
    end
end
=begin
opts = {
    depth_limit: 0
}

Anemone.crawl("http://cookpad.com/recipe/3397736", opts) do |anemone|
    anemone.on_every_page do |page|
        page.doc.xpath("//*[@id='main-photo']/img").each do |node|

    puts 'hoge'
            image_resource = node.attribute('src')
            puts image_resource
#            save_image(image_resource)
            insert_image(image_resource)
        end
    end
end
=end
end
end
