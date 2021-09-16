animacom インフラのコードです。

1. 初期化(各ディレクトリで実行)
   `terraform init --backend-config=../env/backend.config`

2. 変更の確認
   `terraform plan`

3. 適用
   `terraform apply`

# 各ディレクトリ構成説明

## alb

ロードバランサーの作成。

## backend

state ファイルを保存する S3 バケットと競合適用を避けるための DynamoDB を作成。

## ecs_rails

ECS Fargate で rails + nginx コンテナを作成。

## elasticache_redis

Redis の作成。

## env

環境変数の設定

## iam_role

iam_role を作成するためのモジュール

## network

vpc・subnet・route table など基本的なネットワーク構成の作成

## rds

RDS (MySql)の作成

## s3_images

画像を保存する S3 の作成
CloudFront 経由で見れるようにしている

## spa

CloudFront にてフロントを表示している
