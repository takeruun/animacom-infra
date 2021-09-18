# Animacom
自分のペットを共有し合うSNSサイト
(開発中）

# クラウドアーキテクチャ

<img width="1139" alt="スクリーンショット 2021-09-17 23 14 29" src="https://user-images.githubusercontent.com/48900966/133797453-fad2b053-7df5-4a09-88f3-642a3a09df1e.png">


バックエンドリポジトリ ： https://github.com/takeruun/animacom-back 

フロントエンドリポジトリ ： https://github.com/takeruun/animacom-front

# 使用技術
- Ruby 2.7.1
- Ruby on Rails 6.1.4.1
- React 17.0.2
- TypeScript 4.1.2
- Docker 20.10.8
- CircleCI
- AWS
  - VPC
  - ECS
    - Fargate
  - ECR
  - ALB
  - RDS
  - ElastiCache for Redis
  - S3
  - CloudFront
  - ACM
  - Route 53(ドメインはawsではないです)
  -CloudWatch


# 開発した目的
フロントエンドの技術もできるようになっておきたいため、Reat + TypeScript で本サイトを開発しました。<br/>


# テスト
テストには、RSpec, Jestを使用しています。

# CI/CD
### バックエンド
masterブランチにマージ → RSpecによるテスト通過 → ECRへイメージのプッシュ → ECSサービスのアップデートの実行をしています。
<img width="1037" alt="スクリーンショット 2021-09-17 23 19 25" src="https://user-images.githubusercontent.com/48900966/133798209-c4a78358-597a-47db-aecf-0e64bcf272de.png">

### フロントエンド
masterブランチにマージ → Jestによるテスト通過 → ビルド → s3アップロードの実行しています。
<img width="1031" alt="スクリーンショット 2021-09-17 23 21 22" src="https://user-images.githubusercontent.com/48900966/133798445-929c99fc-ac1d-4112-8846-bf58c8f856bc.png">


# 各ディレクトリ構成説明
|ディレクト|説明|
|-|-|
|alb|ロードバランサーの作成|
|backend|state ファイルを保存する S3 バケットと競合適用を避けるための DynamoDB を作成|
|ecs_rails|ECS Fargate で rails + nginx コンテナを作成|
|elasticache_redis|Redis の作成|
|env|環境変数の設定|
|iam_role|iam_role を作成するためのモジュール|
|network|vpc・subnet・route table など基本的なネットワーク構成の作成|
|rds|RDS (MySql)の作成|
|s3_images|画像を保存する S3 の作成 CloudFront 経由で見れるようにしている|
|spa|フロントを表示するCloudFrontの作成|
