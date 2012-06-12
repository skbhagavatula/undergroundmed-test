require 'you_tube_api_calls_helper'
require 'uri'

class ShowVideosController < ApplicationController

  def init
    #response = YouTubeApiCallsHelper.get_video_list
    #@video_list = YouTubeApiCallsHelper.parse_video_list(response.body)
    #@video_list = sort_by_order(@video_list)
    @featured_video_id="WF1s01ePXLI"
  end

  def get_list
    c = params[:category]

    response = YouTubeApiCallsHelper.get_video_list
    @video_list = YouTubeApiCallsHelper.parse_video_list(response.body)
    @video_list = sort_by_order(@video_list)

    render json: @video_list
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
