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



=begin

### 
### ### Use this scheduler for scraping article contents from urls in queue
###
scheduler.in '10s' do

	
	UrlQueue.where(date_scraped: nil).each{|link|
		puts "working on #{link}"
		article_text = []
		article_text << get_stuff_from_page(link.url,"//div[contains(@class, 'article')]//p")[0..-1].join(" ").strip.squeeze
		link.update!(:date_scraped => Date.today)
		puts "scraped article text from #{link}"

		n_gram = NGram.new(article_text, :n => [1,2,3,4,5])	
		n_gram.ngrams_of_all_data.each{ | big_key, v |
			v.sort_by{ | k, v | v }.each{ | k, v |
				@ngram_object_in_db = Ngram.where(date: Date.today).where(terms: "#{k}")
				if @ngram_object_in_db.exists?
					@ngram_object_in_db[0].increment!(:occurrences, v)
				else
					Ngram.create!(:date => Date.today, :n => "#{big_key}-gram", :terms => "#{k}", :occurrences => "#{v}")
				end
			}
		}
		puts "done adding 1-5grams from paragraph text found at #{link}"

	}
	puts "\n\n\n ~*~*~ \nDone adding NGrams to db\n ~*~*~ \n\n\n"
end


=end