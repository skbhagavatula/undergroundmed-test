require 'uri'

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

  def ShowVideosHelper.get_title(id, all_videos)
    title = nil

    for video in all_videos
      if(video.yt_id == id)
        title = video.title
        break
      end
    end

    return title
  end

  def ShowVideosHelper.find_id(id, all_videos)
    found = false

    for video in all_videos
      if(video.yt_id == id)
        found = true
        break
      end
    end

    return found
  end

  # weakness of this method is that it only works on single byte chars
  # needs to be changed to support multi-byte chars
  def ShowVideosHelper.xor_decrypt(encrypted_string, xor_key)
    decrypted_chars = [];
      encrypted_string.each_byte { |c|
      decrypted_chars.push((c ^ xor_key).chr)
    }

    decrypted_string = ""
    decrypted_chars.each { |x| decrypted_string += x }

    return decrypted_string
  end

end
