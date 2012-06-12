class ContactDetail
  attr_accessor :make_video, :review_video, :add_to_list, :comment, :name, :email

  def initialize(make_video, review_video, add_to_list, comment, name, email_address)
    @make_video = make_video
    @review_video = review_video
    @add_to_list = add_to_list
    @comment = comment
    @name = name
    @email = email_address
  end

end