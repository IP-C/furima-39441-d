# README
# テーブル設計

## users テーブル

ユーザー情報を管理するテーブルです。

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| id                 | bigint | primary key |
| username           | string |             |
| email              | string | null: false |
| password_digest    | string | null: false |

- `id`: ユーザーの一意の識別子 (Primary Key)
- `username`: ユーザー名
- `email`: メールアドレス
- `password_digest`: パスワードのハッシュ化された値

## products テーブル

商品情報を管理するテーブルです。

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| id          | bigint  | primary key |
| title       | string  |             |
| description | text    |             |
| price       | integer |             |
| user_id     | bigint  | foreign key |

- `id`: 商品の一意の識別子 (Primary Key)
- `title`: 商品名
- `description`: 商品の説明
- `price`: 商品の価格
- `user_id`: 商品を出品したユーザーの識別子 (Foreign Key, Usersテーブルとの関連)

## orders テーブル

商品の購入情報を管理するテーブルです。

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| id           | bigint  | primary key |
| user_id      | bigint  | foreign key |
| product_id   | bigint  | foreign key |
| quantity     | integer |             |
| total_price  | integer |             |

- `id`: 購入履歴の一意の識別子 (Primary Key)
- `user_id`: 購入者のユーザー識別子 (Foreign Key, Usersテーブルとの関連)
- `product_id`: 購入した商品の識別子 (Foreign Key, Productsテーブルとの関連)
- `quantity`: 購入数量
- `total_price`: 購入合計金額
