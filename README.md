# aichan

Lineで友だちになってメッセージを送ってください。

単語を送ることでそれに対応する言葉を返します。

## Line友だち追加QRコード

<a href="https://line.me/R/ti/p/%40bnx9792z"><img height="36" border="0" alt="友だち追加" src="https://scdn.line-apps.com/n/line_add_friends/btn/ja.png"></a>

![友達追加QRコード](doc/img/qr.png "友達追加QRコード")

## 設定画面

https://aichan-talk.herokuapp.com/


## 開発者用情報

## github

https://github.com/yfujii01/aichan

## heroku管理画面

https://dashboard.heroku.com/apps/aichan-talk

## ローカルで動作確認する場合

.env.sampleの中身を書き換え.envにリネームする

ngrokなどでhttps公開する

## etc

* Ruby version

2.4.1p111

* System dependencies

develop:sqlite3

production:postgresql

* Configuration

* Database creation

```
$ rails db:migrate
```

* Database initialization

```
$ rails db:seed
```

* How to run the test suite

```
$ bundle exec rubocop -a
$ rails test
```

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Once merged into the master it will be deployed automatically.

## Line Messaging APIから送られるメッセージ(サンプル)

```
{
  "events": [
    {
      "replyToken": "00000000000000000000000000000000",
      "type": "message",
      "timestamp": 1544620669123,
      "source": {
        "type": "user",
        "userId": "Udeadbeefdeadbeefdeadbeefdeadbeef"
      },
      "message": {
        "id": "100001",
        "type": "text",
        "text": "Hello, world"
      }
    },
    {
      "replyToken": "ffffffffffffffffffffffffffffffff",
      "type": "message",
      "timestamp": 1544620669123,
      "source": {
        "type": "user",
        "userId": "Udeadbeefdeadbeefdeadbeefdeadbeef"
      },
      "message": {
        "id": "100002",
        "type": "sticker",
        "packageId": "1",
        "stickerId": "1"
      }
    }
  ],
  "linetalk": {
    "events": [
      {
        "replyToken": "00000000000000000000000000000000",
        "type": "message",
        "timestamp": 1544620669123,
        "source": {
          "type": "user",
          "userId": "Udeadbeefdeadbeefdeadbeefdeadbeef"
        },
        "message": {
          "id": "100001",
          "type": "text",
          "text": "Hello, world"
        }
      },
      {
        "replyToken": "ffffffffffffffffffffffffffffffff",
        "type": "message",
        "timestamp": 1544620669123,
        "source": {
          "type": "user",
          "userId": "Udeadbeefdeadbeefdeadbeefdeadbeef"
        },
        "message": {
          "id": "100002",
          "type": "sticker",
          "packageId": "1",
          "stickerId": "1"
        }
      }
    ]
  }
}
```


画像提供：<a href=https://ai-catcher.com/>アイキャッチャー</a>
