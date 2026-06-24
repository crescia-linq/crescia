# 口コミウィジェット セットアップ手順

既存のHTMLサイトに、口コミ投稿フォーム＋一覧表示をそのまま貼り付けるための手順です。

## 1. Supabaseプロジェクトを作成

1. https://supabase.com で無料アカウントを作成し、新規プロジェクトを作成する。
2. 「SQL Editor」を開き、`supabase-schema.sql` の内容をすべて貼り付けて実行する。
   → `reviews` テーブルが作成されます（承認制ではなく、投稿はすぐに一覧へ表示されます）。
3. 「Project Settings」→「API」を開き、以下をメモする。
   - Project URL（例: `https://xxxxx.supabase.co`）
   - `anon` `public` キー

## 2. ウィジェットを既存ページに貼り付け

1. `review-widget-supabase.html`（Supabase接続版）の中身を全部コピーする。
   ※ `review-widget.html` はSupabase接続なしのダミー版（動作確認用）です。
2. 口コミを表示したい既存HTMLファイルの `<body>` 内、表示したい場所に貼り付ける。
3. 貼り付けたコードの中の以下2箇所を、手順1でメモした値に書き換える。

```js
var SUPABASE_URL = "https://xxxxx.supabase.co";
var SUPABASE_ANON_KEY = "（anon publicキー）";
```

これだけで、投稿フォームと口コミ一覧がそのページに表示されます。

## 3. 動作確認

- フォームから投稿 → 一覧にすぐ表示されることを確認。
- Supabaseの「Table Editor」→「reviews」テーブルにも行が追加されていることを確認。

## 不適切な投稿の削除

承認制ではないため、不適切な投稿があった場合はSupabaseの「Table Editor」→「reviews」テーブルから
該当行を直接削除してください。

## 補足

- スパム対策（reCAPTCHA等）は入れていません。荒れるようであれば後から追加を検討してください。
- 同じページに複数回貼り付けると `id="kuchikomi-widget"` が重複するため、1ページに1つだけ貼り付けてください。
