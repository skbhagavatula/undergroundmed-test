module ShowVideosHelper

  def ShowVideosHelper.get_list_by_category(category, all_videos)
         video_list = []

         if(category == VideoAttributes::ALL)
           return all_videos
         end

         for video in all_videos
           if(video.category == category)
             video_list.push(video)
           end
         end

          return video_list
  end

end
