# Kanban

## Stage 0 — Scaffold

- [x] Generate the app: `mix phx.new kanban --live --database sqlite3`
- [x] Local HTTPS (mkcert)

  - Trust the local CA: `mkcert -install`
  - Generate certs inside the project:

    ```bash
    mkdir -p priv/cert
    mkcert \
      -key-file priv/cert/localhost-key.pem \
      -cert-file priv/cert/localhost.pem \
      localhost 127.0.0.1 ::1
    ```

- [x] Reproducible Dev Environment (`nix develop`)

## Stage 1 — Models & CRUD

- [ ] Create `Board` schema
- [ ] Create `Column` schema
- [ ] Create `Card` schema
- [ ] Implement basic CRUD forms and routes

## Stage 2 — LiveView

- [ ] Add drag-and-drop for cards (phx-hook / `Phoenix.Component` JS)
- [ ] Enable reactive list updates (no full-page reload)

## Stage 3 — Channels & Presence

- [ ] Show avatars of users currently viewing the board
- [ ] Broadcast `card_moved` event to all clients in real-time

## Stage 4 — Authentication

- [ ] Add auth via `mix phx.gen.auth`
- [ ] Support private and public boards

## Stage 5 — Tests & CI

- [ ] Write ExUnit tests for contexts
- [ ] Add LiveView tests (Wallaby / Playwright)
- [ ] Set up GitHub Actions: `mix test && mix format --check-formatted`

## Stage 6 — Deploy

- [ ] Prepare release: `MIX_ENV=prod mix release`
- [ ] Deploy to Gigalixir / Fly.io / Render
