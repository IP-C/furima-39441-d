# README
# テーブル設計

## users テーブル

ユーザー情報を管理するテーブルです。

| Column             | Type    | Options                       |
| ------------------ | ------- | ----------------------------- |
| username           | string  | null: false                   |
| email              | string  | null: false, unique: true     |
| encrypted_password | string  | null: false                   |
| last_name_kanji    | string  | null: false                   |
| first_name_kanji   | string  | null: false                   |
| last_name_kana     | string  | null: false                   |
| first_name_kana    | string  | null: false                   |
| birth_date         | date    | null: false                   |

- `username`: ユーザー名
- `email`: メールアドレス (一意性を持つ)
- `encrypted_password`: パスワードのハッシュ化された値
- `last_name_kanji`: 漢字での名字
- `first_name_kanji`: 漢字での名前
- `last_name_kana`: カタカナでの名字
- `first_name_kana`: カタカナでの名前
- `birth_date`: 誕生日 (年・月・日を統合して保存)

### アソシエーション
- User（ユーザー）と Address（発送先情報）は1対多の関係です。1人のユーザーは複数の発送先情報を持つことができます。Userモデルに`has_many :addresses`というアソシエーションを追加しましょう。
- User（ユーザー）と Product（商品）も1対多の関係です。1人のユーザーは複数の商品を出品できます。Userモデルに`has_many :products`というアソシエーションを追加しましょう。
- User（ユーザー）と Order（購入情報）も1対多の関係です。1人のユーザーは複数の購入情報を持つことができます。Userモデルに`has_many :orders`というアソシエーションを追加しましょう。

## items テーブル

商品情報を管理するテーブルです。

| Column           | Type       | Options       |
| ---------------- | ---------- | ------------- |
| title            | string     | null: false   |
| description      | text       | null: false   |
| price            | integer    | null: false   |
| category_id      | integer    | null: false   |
| condition_id     | integer    | null: false   |
| shipping_id      | integer    | null: false   |
| prefecture_id    | integer    | null: false   |
| delivery_days    | integer    | null: false   |
| user             | bigint     | foreign key   |

- `title`: 商品名
- `description`: 商品の説明
- `price`: 商品の価格
- `category_id`: カテゴリー (外部キー, カテゴリーテーブルとの関連)
- `condition_id`: 商品の状態 (外部キー, コンディションテーブルとの関連)
- `shipping_id`: 配送料の負担 (外部キー, 配送料テーブルとの関連)
- `prefecture_id`: 発送元の地域 (外部キー, 都道府県テーブルとの関連)
- `delivery_days`: 発送までの日数
- `user`: 商品を出品したユーザー (外部キー, Usersテーブルとの関連)

### アソシエーション
- 商品テーブル (`items`) とカテゴリーテーブル (`categories`) の関連を設定しましょう。`belongs_to :category` というアソシエーションを `Item` モデルに追加します。
- 商品テーブル (`items`) とコンディションテーブル (`conditions`) の関連を設定しましょう。`belongs_to :condition` というアソシエーションを `Item` モデルに追加します。
- 商品テーブル (`items`) と配送料テーブル (`shippings`) の関連を設定しましょう。`belongs_to :shipping` というアソシエーションを `Item` モデルに追加します。
- 商品テーブル (`items`) と都道府県テーブル (`prefectures`) の関連を設定しましょう。`belongs_to :prefecture` というアソシエーションを `Item` モデルに追加します。
- 商品テーブル (`items`) とユーザーテーブル (`users`) の関連を設定しましょう。`belongs_to :user` というアソシエーションを `Item` モデルに追加します。


## orders テーブル

商品の購入情報を管理するテーブルです。

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | foreign_key: true, null: false |
| item        | references | foreign_key: true, null: false |

- `user`: 購入者のユーザー識別子 (Foreign Key, Userテーブルとの関連, belongs_to :user)
- `item`: 購入した商品の識別子 (Foreign Key, Itemテーブルとの関連, belongs_to :item)

### アソシエーション
- 購入情報テーブル (`orders`) とユーザーテーブル (`users`) の関連を設定しましょう。`belongs_to :user` というアソシエーションを `Order` モデルに追加します。
- 購入情報テーブル (`orders`) と商品テーブル (`items`) の関連を設定しましょう。`belongs_to :item` というアソシエーションを `Order` モデルに追加します。

## addresses テーブル

発送先情報を管理するテーブルです。

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| postal_code      | string  | null: false                    |
| prefecture_id    | integer | null: false                    |
| city             | string  | null: false                    |
| house_number     | string  | null: false                    |
| building         | string  |                                |
| phone_number     | string  | null: false                    |

- `postal_code`: 郵便番号
- `prefecture`: 都道府県
- `city`: 市区町村
- `house_number`: 番地
- `building`: 建物名（任意）
- `phone_number`: 電話番号（必須）

### アソシエーション
- 発送先情報テーブル (`addresses`) とユーザーテーブル (`users`) の関連を設定しましょう。`belongs_to :user` というアソシエーションを `Address` モデルに追加します。
- 発送先情報テーブル (`addresses`) と都道府県テーブル (`prefectures`) の関連を設定しましょう。`belongs_to :prefecture` というアソシエーションを `Address` モデルに追加します。