# frozen_string_literal: true

class LinebotController < ApplicationController
  require 'line/bot' # gem 'line-bot-api'
  require 'wikipedia'

  # 日本語版Wikipediaを利用する
  Wikipedia.Configure do
    domain 'ja.wikipedia.org'
    path 'w/api.php'
  end

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
    unless client.validate_signature(body, signature)
      response_bad_request
      return
    end

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
    talkword = talkrecord.message unless talkrecord.nil?
    talkword = get_wikipedia(event.message['text']) if talkrecord.nil?
    talkword = no_message if talkword.nil?
    message = {
      type: 'text',
      text: talkword
    }
    message
  end

  def no_message
    "すみません。その単語の意味は理解しかねます。
もしよろしければこちらの画面から言葉を教えていただけないでしょうか？
https://aichan-talk.herokuapp.com/"
  end

  def get_wikipedia(text)
    page = Wikipedia.find(text)
    return if page.nil?

    puts page.summary
    page.summary
  end

  def response_bad_request
    render status: 400, json: { status: 400, message: 'Bad Request' }
  end
end
