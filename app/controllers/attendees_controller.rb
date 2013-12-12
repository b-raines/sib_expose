class AttendeesController < ApplicationController
  require 'open-uri'

  def index
    scrape
    @attendees = Attendee.all
  end

  def scrape
    @doc = Nokogiri::HTML(open('http://www.eventbrite.com/e/startup-institute-boston-student-expose-fall-2013-tickets-9277432049#m_1_200'))

    @row_data = @doc.css('#pagedown_1 b').map(&:text)
  end
end
