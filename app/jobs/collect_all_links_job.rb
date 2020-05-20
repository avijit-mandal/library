class CollectAllLinksJob < ActiveJob::Base
  queue_as :default
  require 'redis'
  require 'redis-namespace'

  def perform
    redis = Redis::Namespace.new("medicine", :redis => Redis.new)

    # doc = Nokogiri::HTML(open('http://www.medguideindia.com/show_brand.php'))

    # links_div = doc.css('.tabsborder2 table .mosttext')
    # links = links_div.search('option').map { |link| "http://www.medguideindia.com/#{link['value']}"}

    454.upto(473) do |i|
      link = "http://www.medguideindia.com/show_brand.php?nav_link=&pageNum_rr=#{i}&nav_link=&selectme=#{i}"

      redis.sadd('page_links', link)
    end

    # redis.sadd('med_links', links) if links.present?
  end
end