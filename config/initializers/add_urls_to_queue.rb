scheduler = Rufus::Scheduler.new

def get_stuff_from_page(page,xpath)
	begin
	  request = RestClient::Resource.new(page, :verify_ssl => false).get
	rescue RestClient::NotFound => not_found
	  return not_found
	rescue 
	  return nil
	else
	  	payload = []
	  	Nokogiri::HTML(request).xpath(xpath).map{|item|
			payload << item.text.strip if item != nil
		}
		return payload
	end
end

### 
### ### Use this scheduler for adding urls to queue
###
#scheduler.ever '2s' do
scheduler.every '20m', :first_in => '2s' do

	## FOX NEWS
	pub_name = "fox news"
	homepage = "http://www.foxnews.com/"
	xpath = "//*[@class='title']/a/@href"

	#links = []
	homepage_article_links = get_stuff_from_page(homepage,xpath).reject{|link| link.include?("video.fox")}.reject{|link| link.length < 20}.reject{|link| link.include?("radio.foxnews.com")}.map{|url| (url.start_with?("//") ? url[2..-1] : url) }#.reject{|link| link.include?("")}
	homepage_article_links.uniq.each{|link|
		puts "processing #{link}"
		unless UrlQueue.where(:url => link).count > 0
			UrlQueue.create!(:date_added_to_queue => Date.today, :publication => pub_name, :url => link)
		end
	}

	## DRUDGE REPORT
	pub_name = "drudge report"
	homepage = "http://www.drudgereport.com/"
	xpath = "//a/@href"

	homepage_article_links = get_stuff_from_page(homepage,xpath).reject{ |link| link.each_char.count < 65 }
	homepage_article_links.uniq.each{|link|
		unless UrlQueue.where(:url => link).count > 0
			UrlQueue.create!(:date_added_to_queue => Date.today, :publication => pub_name, :url => link)
		end
	}
	

	puts "\n\n\n ~*~*~ \nDone adding links to URLQueue\n ~*~*~ \n\n\n"
end