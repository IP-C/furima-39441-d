# README
# テーブル設計

## users テーブル

ユーザー情報を管理するテーブルです。

| Column             | Type    | Options                       |
| ------------------ | ------- | ------------------------------ |
| id                 | bigint  | primary key                   |
| username           | string  | null: false                   |
| email              | string  | null: false, unique: true     |
| encrypted_password | string  | null: false                   |
| last_name_kanji    | string  | null: false                   |
| first_name_kanji   | string  | null: false                   |
| last_name_kana     | string  | null: false                   |
| first_name_kana    | string  | null: false                   |
| birth_date         | date    | null: false                   |

- `id`: ユーザーの一意の識別子 (Primary Key)
- `username`: ユーザー名
- `email`: メールアドレス (一意性を持つ)
- `encrypted_password`: パスワードのハッシュ化された値
- `last_name_kanji`: 漢字での名字
- `first_name_kanji`: 漢字での名前
- `last_name_kana`: カタカナでの名字
- `first_name_kana`: カタカナでの名前
- `birth_date`: 誕生日 (年・月・日を統合して保存)

## items テーブル

商品情報を管理するテーブルです。

| Column       | Type       | Options                        |
| ------------ | -------    | -------------------------      |
| id           | bigint     | primary key                    |
| title        | string     | null: false                    |
| description  | text       | null: false                    |
| price        | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

- `id`: 商品の一意の識別子 (Primary Key)
- `title`: 商品名
- `description`: 商品の説明
- `price`: 商品の価格
- `user`: 商品を出品したユーザー (外部キー, Usersテーブルとの関連)

## orders テーブル

商品の購入情報を管理するテーブルです。

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| id               | bigint  | primary key                    |
| user_id          | bigint  | foreign key                    |
| product_id       | bigint  | foreign key                    |

- `id`: 購入履歴の一意の識別子 (Primary Key)
- `user_id`: 購入者のユーザー識別子 (Foreign Key, Usersテーブルとの関連)
- `product_id`: 購入した商品の識別子 (Foreign Key, Productsテーブルとの関連)

## addresses テーブル

発送先情報を管理するテーブルです。

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| id               | bigint  | primary key                    |
| user_id          | bigint  | foreign key                    |
| postal_code      | string  | null: false                    |
| prefecture       | string  | null: false                    |
| city             | string  | null: false                    |
| house_number     | string  | null: false                    |
| building         | string  |                                |
| phone_number     | string  |                                |

- `id`: 発送先情報の一意の識別子 (Primary Key)
- `user_id`: 発送先情報を所有するユーザーの識別子 (Foreign Key, Usersテーブルとの関連)
- `postal_code`: 郵便番号
- `prefecture`: 都道府県
- `city`: 市区町村
- `house_number`: 番地
- `building`: 建物名（任意）
- `phone_number`: 電話番号

# テーブル間のアソシエーション

- User（ユーザー）と Address（発送先情報）は1対多の関係です。1人のユーザーは複数の発送先情報を持つことができます。Userモデルに`has_many :addresses`というアソシエーションを追加しましょう。

- User（ユーザー）と Product（商品）も1対多の関係です。1人のユーザーは複数の商品を出品できます。Userモデルに`has_many :products`というアソシエーションを追加しましょう。

- Product（商品）と Order（購入情報）は1対多の関係です。1つの商品は複数の購入情報を持つことができます。Productモデルに`has_many :orders`というアソシエーションを追加しましょう。

- User（ユーザー）と Order（購入情報）も1対多の関係です。1人のユーザーは複数の購入情報を持つことができます。Userモデルに`has_many :orders`というアソシエーションを追加しましょう。

- Order（購入情報）と Address（発送先情報）も1対多の関係です。1つの購入情報には1つの発送先情報が紐づきます。Orderモデルに`belongs_to :address`というアソシエーションを追加しましょう。

- Order（購入情報）と Product（商品）も1対多の関係です。1つの購入情報には1つの商品が紐づきます。Orderモデル
