-- Attack on Titan watch tracker — run once in Supabase → SQL Editor

create table if not exists public.watch_log (
  episode_code text        not null,                  -- e.g. 'S3E13'
  viewer       text        not null check (viewer in ('Nancy', 'Skip', 'Gavin', 'BP')),
  watched_at   timestamptz not null default now(),
  primary key (episode_code, viewer)
);

-- Row Level Security: the site uses the public anon key with no logins,
-- so anyone with the link can read and tick/untick. Fine for a friends group.
alter table public.watch_log enable row level security;

-- Make sure the website's key can reach the table (needed if
-- "Automatically expose new tables" was unticked when the project was created)
grant select, insert, delete on public.watch_log to anon;

create policy "anyone can read"   on public.watch_log for select to anon using (true);
create policy "anyone can tick"   on public.watch_log for insert to anon with check (true);
create policy "anyone can untick" on public.watch_log for delete to anon using (true);

-- Live sync: push ticks to everyone's open page instantly
alter publication supabase_realtime add table public.watch_log;
