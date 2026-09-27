-- Editora V0.1 project records.
-- The row is an index over a versioned project.json document. Editing
-- instructions live in project_json; rendered video is never stored here.

create table if not exists projects (
  id           text primary key,
  user_id      text not null,
  name         text not null,
  type         text not null check (type in ('short', 'long')),
  project_json jsonb not null,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

create index if not exists projects_user_id_idx
  on projects (user_id);

create index if not exists projects_user_type_updated_idx
  on projects (user_id, type, updated_at desc);
