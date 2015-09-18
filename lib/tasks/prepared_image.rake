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
urls = ["http://cookpad.com/user_kondates"]
opts = {
    depth_limit: 0
}
new_urls =Array.new()


Anemone.crawl(urls, opts) do |anemone|
    anemone.on_every_page do |page|
        page.doc.xpath('//*[@id="main"]/div[5]/div/div[1]/*/a').each do |node|
            url = node.attribute('href')
            new_urls.push("http://cookpad.com#{url}")
        end
    end
end


opts = {
    depth_limit: 1
}

Anemone.crawl(new_urls, opts) do |anemone|
    anemone.focus_crawl do |page|
      page.links.keep_if {|link|
        link.to_s.match(
                /http:\/\/cookpad.com\/user_kondates\/[0-9]*/)
      }
    end
    anemone.on_every_page do |page|
        page.doc.xpath('//*[@id="kondate_photo"]').each do |node|
            image_resource = node.attribute('src')
            puts image_resource
    insert_image(image_resource)
        end
    end
end


=begin
Anemone.crawl("http://cookpad.com/search/%E5%AE%9A%E9%A3%9F", opts) do |anemone|

    anemone.focus_crawl do |page|
      page.links.keep_if {|link|
        link.to_s.match(
                /http:\/\/cookpad.com\/user_kondates\/[0-9]*/)
      }
    end

    anemone.on_every_page do |page|
        page.doc.xpath('//*[@id="kondate_photo"]').each do |node|
            image_resource = node.attribute('src')
            puts image_resource
            insert_image(image_resource)
        end
        page.doc.xpath('//*[@id="main-photo"]/img').each do |node|
            image_resource = node.attribute('src')
            puts image_resource
            insert_image(image_resource)
        end

    end
end
=end
end
end



