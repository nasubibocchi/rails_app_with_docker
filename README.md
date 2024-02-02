# README

### 初回手順
1. dockerイメージのビルド
```
docker-compose build --no-cache
```
Gemfileの編集などを行った場合、再ビルドする。

2. アプリとDBの起動
```
docker-compose up -d
```

3. DBの作成
```
docker-compose run --rm web bin/rails db:create db:migrate
```

### アプリの停止
```
docker-compose down
```

### アプリの再起動
```
docker-compose up -d
```
