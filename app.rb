get "/" do
  slim :index
end

post "/" do
  @upload = Upload.new(params["file"]["tempfile"])
  json @upload.data
end
