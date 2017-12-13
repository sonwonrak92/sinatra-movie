require 'sinatra'
require 'nokogiri'
require 'open-uri'

get	'/' do
	erb :index
end

get '/movie' do

@url = 'http://movie.naver.com/movie/running/current.nhn'
@doc = Nokogiri::HTML(open(@url),nil,'UTF-8')
@movie_title = Array.new

@doc.css("ul.lst_detail_t1 dt a").each do |title|
	@movie_title << title
end
@movie = @movie_title.sample

erb :movie

end