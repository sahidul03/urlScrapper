class UrlsController < ApplicationController

  # GET /urls
  def index
    @urls = Url.all

    render json: @urls
  end

  # POST /urls
  def create
    Url.create
    @url = Url.new(:url => params[:url])

    if @url.save

      # Fetch and parse HTML document
      doc = Nokogiri::HTML(@url.url)

      doc.css('h1').each do |tag|
        if tag.content
          Content.create(:tag => 'h1', :content => tag.content)
        end
      end
      doc.css('h2').each do |tag|
        if tag.content
          Content.create(:tag => 'h2', :content => tag.content)
        end
      end
      doc.css('h3').each do |tag|
        if tag.content
          Content.create(:tag => 'h3', :content => tag.content)
        end
      end
      doc.css('a').each do |link|
        if link['href']
          Content.create(:tag => 'a', :content => link['href'])
        end
      end
      render json: @url, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end

  end

end
