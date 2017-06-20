get "/" do
  slim :index
end

post "/" do
  filename = params["file"]["filename"]
  file = params["file"]["tempfile"]
  upload = Upload.new(filename, file)

  json upload
end
