class MailContactDetail < ActionMailer::Base

  FROM = "rich.cohen@i-intime.org"
  TO =  "iintimetest@gmail.com"
  SUBJECT = "New Contact"

  default from:  FROM
  default to: TO
  default subject: SUBJECT

  def send_detail  (contact_detail)
        @contact_detail = contact_detail

        begin
          mail
        rescue Exception
          STDERR.puts "mail failed: #{$!}"
        end
  end

end
