class MailContactDetail < ActionMailer::Base

  FROM_DEV = "rich.cohen@i-intime.org"
  TO_DEV =  "iintimetest@gmail.com"
  SUBJECT_DEV = "New Contact -- Development"

  FROM_PRODUCTION = "umed.iintime@i-intime.org"
  TO_PRODUCTION =  "umed.iintime@gmail.com"
  SUBJECT_PRODUCTION = "New Contact"


  def send_detail  (contact_detail)
        @contact_detail = contact_detail
        @from_address =   FROM_PRODUCTION
        @to_address =  TO_PRODUCTION
        @subject =   SUBJECT_PRODUCTION


        if(!RunTimeEnvironment.is_production?)
          @from_address =   FROM_DEV
          @to_address =  TO_DEV
          @subject  =   SUBJECT_DEV
        end

        begin
          mail ({:to => @to_address,  :from => @from_address, :subject => @subject })
        rescue Exception
          STDERR.puts "mail failed: #{$!}"
        end
  end

end
