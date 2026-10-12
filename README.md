# Attack on Titan Watch Tracker

Single-page site: `index.html` + a Supabase table for the checkboxes.

## Setup

1. **Supabase** — create a new project, open **SQL Editor**, paste in `schema.sql`, and run it.
2. **Keys** — in Supabase go to **Project Settings → API** and copy the **Project URL** and the **anon public** key.
3. **Paste them** into the two lines at the top of the `<script>` in `index.html`:
   ```js
   const SUPABASE_URL = "https://xxxx.supabase.co";
   const SUPABASE_ANON_KEY = "eyJ...";
   ```
4. **Netlify** — push the folder to a GitHub repo and connect it in Netlify (no build command, publish directory `/`), or drag the folder onto Netlify's deploy page.

Until step 3 is done, the page runs in demo mode and saves ticks in the browser only.

## Editing the data

Everything lives in the `data` block near the top of the script:

- `SESSIONS` — in-person ranges
- `SKIPS` — intro timecodes in seconds (`at: 0` means the intro starts right away)
- `CREDITS_EPISODE` — the one episode to watch the credits for
- `RUNTIME_OVERRIDE` — non-24-minute episodes (the two finale specials)
- `RATINGS` — IMDb ratings, pulled October 2026

## Note on access

There are no logins: anyone with the URL can tick boxes. If you ever want to lock it down, the easy option is Netlify's site password (paid plans) or adding Supabase auth.
