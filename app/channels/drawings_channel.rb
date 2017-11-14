class DrawingsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'drawings'
  end
end
