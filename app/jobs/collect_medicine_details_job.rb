class CollectMedicineDetailsJob < ActiveJob::Base
  queue_as :default
  require 'redis'
  require 'redis-namespace'

  def perform(link)
      redis = Redis::Namespace.new("medicine", :redis => Redis.new)

      j = [2, 3, 4, 7, 8]

      while link = redis.spop('med_links') do
        redis.set('current_link', link)
        doc = Nokogiri::HTML(open(link))

        med = doc.css('.tabsborder2')

        for i in 2..51
          hash = {}
          j.each do |num|
            hash[:"#{find_key(num)}"] = med.at_css(".row:nth-child(#{i}) .mosttext:nth-child(#{num})").text.strip
          end
          redis.sadd('med_details', hash)
        end
        Madicine.create(redis.smembers('med_details'))
      end
  end

  private

  def find_key(value)
    case value
    when 2
      return 'manufacturer'
    when 3
      return 'name'
    when 4
      return 'm_type'
    when 7
      return 'unit'
    else
      return 'price'
    end
  end
end