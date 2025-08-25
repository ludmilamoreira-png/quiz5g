-- 1. Cria a tabela (se ainda não existir)
create table if not exists public.ranking (
  id bigint generated always as identity primary key,
  username text not null,
  score int not null default 0
);

-- 2. Garante que username seja único
alter table public.ranking
  add constraint unique_username unique (username);

-- 3. Ativa Row Level Security
alter table public.ranking enable row level security;

-- 4. Políticas de acesso
-- Permite SELECT
create policy "Enable select for anon"
  on public.ranking for select
  to anon
  using (true);

-- Permite INSERT
create policy "Enable insert for anon"
  on public.ranking for insert
  to anon
  with check (true);

-- Permite UPDATE
create policy "Enable update for anon"
  on public.ranking for update
  to anon
  using (true)
  with check (true);
