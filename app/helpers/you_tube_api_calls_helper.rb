module YouTubeApiCallsHelper
  require 'net/http'
  require "rexml/document"

  BASEURI = "http://gdata.youtube.com/feeds/api/videos"
  VIDEOLISTARGS = "?q=undergroundmed&v=2&start-index=1&max-results=50&author=UndergroudMed"
  THUMBNAIL_NAME = "mqdefault"

  def YouTubeApiCallsHelper.get_video_list
    uri = URI.parse(BASEURI)
    host = uri.host
    port = uri.port
    path = uri.path+VIDEOLISTARGS

    http = Net::HTTP.new(host, port)
    response = http.get(path)

    return response
  end

    def YouTubeApiCallsHelper.parse_video_list (xml)
    doc = REXML::Document.new xml
    video_list = []

    doc.elements.each("feed/entry") do |element|
      video =  parse_one_entry(element)

      if(!video.nil?)
        video_list.push(video)
        end
      end

      number_unknown_videos(video_list)
    return video_list
  end

  def YouTubeApiCallsHelper.parse_one_entry(element)
     video = Video.new

     video.title =   element.elements["title"].text
     video.yt_id =   element.elements["id"] .text

     media_group = element.elements["media:group"]

     thumbnails = media_group.get_elements("media:thumbnail")
     thumbnails.each do |tn|
        if  tn.attributes["yt:name"] == THUMBNAIL_NAME
          video.thumbnail =    tn.attributes["url"]
          break
        end
      end

     yt_duration = media_group.elements["yt:duration"]

     if(!yt_duration.nil?)
      video.duration =   yt_duration.attributes["seconds"]
     end

     gd_rating = element.elements["gd:rating"]
     if(!gd_rating.nil?)
       video.avg_rating = gd_rating.attributes["average"]
       video.max_rating = gd_rating.attributes["max"]
       video.min_rating = gd_rating.attributes["min"]
       video.num_raters = gd_rating.attributes["numRaters"]
     end

     yt_rating = element.elements["yt:rating"]
     if(!yt_rating.nil?)
       video.dislikes = yt_rating.attributes["numDislikes"]
       video.likes = yt_rating.attributes["numLikes"]
     end

     yt_statistics = element.elements["yt:statistics"]
     if(!yt_statistics.nil?)
       video.favorite_count = yt_statistics.attributes["favoriteCount"]
       video.view_count = yt_statistics.attributes["viewCount"]
     end

     video.set_duration_minutes
     video.set_category(video.yt_id)
     video.set_order(video.yt_id)
    return video
  end

  # we need an order so that the previous/next buttons will work.
  # best we can do is keep the order they are in
  def YouTubeApiCallsHelper.number_unknown_videos (videolist)
    count = 0;

    videolist.each do |video|
      if(video.order == Video::SORTLAST)
        video.order = (video.order.to_i + count)
        count += 1
      end
    end
  end
end
