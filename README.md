# README
# テーブル設計

## Users テーブル

ユーザー情報を管理するテーブルです。

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| id                 | bigint | primary key |
| username           | string | null: false |
| email              | string | null: false |
| password_digest    | string | null: false |
| last_name_kanji    | string | null: false |
| first_name_kanji   | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

- `id`: ユーザーの一意の識別子 (Primary Key)
- `username`: ユーザー名
- `email`: メールアドレス
- `password_digest`: パスワードのハッシュ化された値
- `last_name_kanji`: 本人確認用漢字の名字
- `first_name_kanji`: 本人確認用漢字の名前
- `last_name_kana`: 本人確認用カタカナの名字
- `first_name_kana`: 本人確認用カタカナの名前
- `birth_year`: 生年（年）
- `birth_month`: 生年（月）
- `birth_day`: 生年（日）

## Items テーブル

商品情報を管理するテーブルです。

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| id          | bigint  | primary key |
| title       | string  | null: false |
| description | text    | null: false |
| price       | integer | null: false |
| user_id     | bigint  | foreign key |

- `id`: 商品の一意の識別子 (Primary Key)
- `title`: 商品名
- `description`: 商品の説明
- `price`: 商品の価格
- `user_id`: 商品を出品したユーザーの識別子 (Foreign Key, Usersテーブルとの関連)

## Orders テーブル

商品の購入情報を管理するテーブルです。

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| id           | bigint  | primary key |
| user_id      | bigint  | foreign key |
| item_id      | bigint  | foreign key |
| quantity     | integer | null: false |
| total_price  | integer | null: false |

- `id`: 購入履歴の一意の識別子 (Primary Key)
- `user_id`: 購入者のユーザー識別子 (Foreign Key, Usersテーブルとの関連)
- `item_id`: 購入した商品の識別子 (Foreign Key, Itemsテーブルとの関連)
- `quantity`: 購入数量
- `total_price`: 購入合計金額

## Addresses テーブル

発送先情報を管理するテーブルです。

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| id           | bigint  | primary key |
| user_id      | bigint  | foreign key |
| postal_code  | string  | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| house_number | string  | null: false |
| building     | string  |             |
| phone_number | string  | null: false |

- `id`: 発送先情報の一意の識別子 (Primary Key)
- `user_id`: この発送先情報が紐づくユーザーの識別子 (Foreign Key, Usersテーブルとの関連)
- `postal_code`: 郵便番号
- `prefecture`: 都道府県
- `city`: 市区町村
- `house_number`: 番地
- `building`: 建物名（任意）
- `phone_number`: 電話番号
