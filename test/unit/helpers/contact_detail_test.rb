require 'test_helper'

class ContactDetailTest < Test::Unit::TestCase

  def setup
    @comment = "Now is the time"
    @name =   "Barack Obama"
    @email =   "pres@whitehouse.gov"

    @mail_detail =  ContactDetail.new(false, false, true, @comment, @name, @email)
  end

  def test_create_contact_detail
    contact_detail = ContactDetail.new(false, false, true, @comment, @name, @email)
    assert_equal(false, contact_detail.make_video)
    assert_equal(false, contact_detail.review_video)
    assert_equal(true, contact_detail.add_to_list)
    assert_equal(@comment, contact_detail.comment)
    assert_equal(@name, contact_detail.name)
    assert_equal(@email, contact_detail.email)

  end

  def test_mail_contact_detail
    mail = MailContactDetail.send_detail(@mail_detail)
    assert_equal([MailContactDetail::FROM_DEV], mail.from)
    assert_equal([MailContactDetail::TO_DEV], mail.to)
    assert_equal(MailContactDetail::SUBJECT_DEV, mail.subject)
    has_comment =  mail.body.encoded.include? @comment
    assert_equal(true, has_comment)
  end

end