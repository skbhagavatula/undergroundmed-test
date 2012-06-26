require 'you_tube_api_calls_helper'
require 'uri'

class ShowVideosController < ApplicationController

  SESSION_KEY_ALL_VIDEOS = "all_videos"
  def init
    @featured_video_id="WF1s01ePXLI"
    @featured_video_title="Chest X-Ray Viewing Method - ABCDE"
    video_list = get_current_list
    @category_list =  get_category_list(video_list)
  end

  def get_category_list  (video_list)
    categories =[ "All" ]

    for video in video_list
      if !categories.include?(video.category)
         categories.push(video.category)
      end
    end

    return sort_by_category(categories)
  end

  def get_list
    category = params[:category]

    @video_list = get_current_list
    @video_list = ShowVideosHelper.get_list_by_category(category, @video_list)
    @video_list = sort_by_order(@video_list)
    #session[SESSION_KEY_ALL_VIDEOS] = @video_list

    render json: @video_list
  end

  def get_current_list
    if(session[SESSION_KEY_ALL_VIDEOS] == nil)
      video_list = get_all_videos
    else
      video_list = session[SESSION_KEY_ALL_VIDEOS]
    end

    return  video_list
  end

=begin
  get_all_videos pages through the YouTube results list. Two factors control paging, YouTubeApiCallsHelper::MAXRESULTS
  which limits the results returned in a query (the max YouTube will return is 50)  and the total results the query generated
  which is in the <openSearch:totalResults> tag.

  The YouTube documentation cautions the the <openSearch:totalResults> may not be accurate because the results of a query which
  returns a large result set can vary as the YouTube site changes. In our case the result set is small so the risk is low using this tag.
=end
  def get_all_videos
    # get the first set of results
    video_list = []
    start_index = 1
    response =   YouTubeApiCallsHelper.get_video_list(start_index)
    YouTubeApiCallsHelper.parse_video_list(response.body, video_list)
    total_results = YouTubeApiCallsHelper.get_total_results(response.body)

    # if there are more results to fetch, loop till we have them all
    while video_list.length  < total_results
      start_index +=  YouTubeApiCallsHelper::MAXRESULTS
      response =   YouTubeApiCallsHelper.get_video_list(start_index)
      YouTubeApiCallsHelper.parse_video_list(response.body, video_list)
    end

    return video_list
  end

  def save_contact
    makeVideo = params[:video]
    reviewVideo = params[:review]
    comments = URI.unescape(params[:comments])
    name = URI.unescape(params[:name])
    email = URI.unescape(params[:email])
    add_to_list = params[:addToList]

    contact_detail = ContactDetail.new(makeVideo, reviewVideo, add_to_list, comments, name, email)
    save_contact_detail (contact_detail)

    msg =["Your selections have been saved. Thanks."]   #json generate wants a data structure, not a string

    render json: msg

  end

  def sort_by_order(videolist)
    sorted_list = videolist.sort { |a,b| a.order.to_i <=> b.order.to_i }
    return sorted_list
  end

  def sort_by_category(category_list)
    sorted_list = category_list.sort { |a,b| a <=> b }
    return sorted_list
  end

  def save_contact_detail (contact_detail)

      MailContactDetail.send_detail(contact_detail).deliver

  end

end
