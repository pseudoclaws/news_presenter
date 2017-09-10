class RootPageChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'root_page'
  end
end