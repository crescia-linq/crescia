-- 口コミウィジェット用スキーマ
-- Supabaseの SQL Editor でそのまま実行してください。

create table if not exists reviews (
  id uuid primary key default gen_random_uuid(),
  nickname text not null check (char_length(nickname) between 1 and 30),
  rating smallint not null check (rating between 1 and 5),
  comment text not null check (char_length(comment) between 1 and 1000),
  created_at timestamptz not null default now()
);

create index if not exists reviews_created_at_idx on reviews (created_at desc);

-- RLS有効化
alter table reviews enable row level security;

-- 誰でも一覧を見られる
drop policy if exists "reviews_select_public" on reviews;
create policy "reviews_select_public" on reviews
  for select using (true);

-- 誰でも投稿できる（承認なしで即時表示される運用）
drop policy if exists "reviews_insert_public" on reviews;
create policy "reviews_insert_public" on reviews
  for insert with check (true);

-- 不適切な投稿はSupabaseダッシュボードの Table Editor から直接削除してください。
