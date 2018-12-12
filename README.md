# aichan

## 友だち追加QRコード

![友達追加QRコード](doc/img/qr.png "友達追加QRコード")

## 設定画面

https://aichan-talk.herokuapp.com/

## github

https://github.com/yfujii01/aichan

## heroku管理画面

https://dashboard.heroku.com/apps/aichan-talk

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