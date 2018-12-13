# frozen_string_literal: true

class LinebotController < ApplicationController
  require 'line/bot' # gem 'line-bot-api'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery except: [:callback]

  def client
    @client ||= Line::Bot::Client.new do |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    end
  end

  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    error(400) { 'Bad Request' } unless client.validate_signature(body, signature)

    events = client.parse_events_from(body)

    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = get_message(event)
          client.reply_message(event['replyToken'], message)
        end
      end
    end

    head :ok
  end

  private

  def get_message(event)
    talkrecord = TalkTable.find_by(input: event.message['text'])
    talkword = "すみません。その単語の意味は理解しかねます。\nもしよろしければこちらの画面から言葉を教えていただけないでしょうか\nhttps://aichan-talk.herokuapp.com/"
    talkword = talkrecord.message unless talkrecord.nil?
    message = {
      type: 'text',
      text: talkword
    }
    message
  end
end
