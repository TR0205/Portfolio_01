# Exposer

https://exposer.ml

自分の気持ちをぬいぐるみを通して発信するアプリです。
開発環境と本番環境にDockerを使用、各種インフラにはAWSを使用しています。

# 使用技術

* Ruby 2.6.5
* Ruby on Rails 5.2.4.2
* MySQL 8.0.19 
* Nginx 1.19.1
* AWS
  * VPC
  * EC2
  * ECS
  * ECR
  * ALB
  * RDS
  * Route53
* Docker
* CircleCI
* GitHub

# 機能一覧

* 投稿機能
* フォロー機能
* いいね機能
* ユーザー登録機能
* ユーザー検索機能
* ログイン機能
* ページネーション機能

# その他
* CircleCIを使用したCI/CDパイプラインの構築
  * GitHubへのプッシュによりテストとデプロイを自動で実行


# インフラ構成図
![configuration_diagram_exposer (1)](https://user-images.githubusercontent.com/65379809/88986799-f1ec0080-d30e-11ea-9b3c-ea3d612c7130.png)
