require 'you_tube_api_calls_helper'
require 'uri'

class ShowVideosController < ApplicationController

  SESSION_KEY_ALL_VIDEOS = "all_videos"
  def init
    @featured_video_id="WF1s01ePXLI"
    @featured_video_title="Insulin Sliding Scale Explaned!"
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
      response =   YouTubeApiCallsHelper.get_video_list
      video_list = YouTubeApiCallsHelper.parse_video_list(response.body)
    else
      video_list = session[SESSION_KEY_ALL_VIDEOS]
    end

    return  video_list
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

    msg =["Saved"]   #json generate wants a data structure, not a string

    render json: msg

  end

  def sort_by_order(videolist)
    sorted_list = videolist.sort { |a,b| a.order.to_i <=> b.order.to_i }
    return sorted_list
  end

  def save_contact_detail (contact_detail)

      MailContactDetail.send_detail(contact_detail).deliver

  end

end
