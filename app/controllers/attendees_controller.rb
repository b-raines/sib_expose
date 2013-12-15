class AttendeesController < ApplicationController

  def index
    get_attendees
  end

  protected

    def get_attendees
      eb_auth_tokens = { app_key: 'L7AQHLVTL7KLKXOVJZ',
                     user_key: '137374979866898169225'}
      eb_client = EventbriteClient.new(eb_auth_tokens)
      @attendees = eb_client.event_list_attendees({ id: 9277432049, only_display: 'first_name,last_name,profile' })
      @attendees.each do |key, value|
        value.each do |attendee|
          attendee.each do |key, values|
            company_name = values["company"]
            company_url = company_name.gsub(/\s/, '+')
            first_name = values["first_name"].capitalize
            last_name = values["last_name"].capitalize
            attendee_name = first_name + " " + last_name
            if Company.find_by(name: company_name).nil?
              company = Company.new(name: company_name, url: 'https://www.google.com/#q='+company_url)
              company.save
              attendee = company.attendees.build(name: attendee_name, url: 'https://www.google.com/#q='+first_name+'+'+last_name+'+'+company_url)
              attendee.save
            else
              company_id = Company.find_by(name: company_name).id
              attendee = Attendee.new(name: attendee_name, company_id: company_id, url: 'https://www.google.com/#q='+first_name+'+'+last_name+'+'+company_url)
              attendee.save
            end
          end
        end
      end
    end

end
