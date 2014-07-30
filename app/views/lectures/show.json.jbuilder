json.extract! @lecture, :id, :name

json.videos do
  @lecture.videos.each do |video|
    json.code video.code
  end
end