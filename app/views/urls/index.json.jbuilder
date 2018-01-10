json.array! @urls do |url|
  json.url url.url
  json.contents url.contents, :id, :tag, :content
end