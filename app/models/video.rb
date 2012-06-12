class Video
  UMTAG = "[UndergroundMed]"    #this string is appended to all titles so we remove it
  IDTAG = "video:"  # the id is embedded in a string  prefaced by this tag
  SORTLAST = "1000"  # high number, should sort last

  attr_accessor :avg_rating, :category, :dislikes, :duration, :duration_in_minutes, :favorite_count, :likes, :max_rating, :min_rating, :num_raters, :order, :thumbnail, :title, :view_count, :yt_id

  def title=(title)
    i =  title.index(UMTAG)
    s = title[0,i]
    @title = s.strip!
  end

  def yt_id=(yt_id)
    i = yt_id.index(IDTAG)
    new_start_index =   i + IDTAG.length
    new_length = yt_id.length - new_start_index
    s = yt_id[new_start_index, new_length]
    @yt_id = s
  end

  def set_category(id)
    category =  VideoAttributes.find_category(id)
    if(category == nil)
      category = VideoAttributes::OTHER
    end
    @category =  category
  end

  def set_order(id)
    order =   VideoAttributes.find_order(id)
    if(order == nil)
      order = SORTLAST
    end
    @order =  order
  end

  def set_duration_minutes
    @duration_in_minutes =  to_minutes(@duration)
  end

  def get_duration_minutes
    return    to_minutes(@duration)
  end

  def to_minutes(seconds)

    m = (seconds.to_i/60).floor
    s = (seconds.to_i - (m * 60)).round

    # add leading zero to one-digit second
    if s < 10
      s = "0#{s}"
    end
    # return formatted time
    return "#{m}:#{s}"
  end

end