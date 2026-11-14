# Aegis Sandbox

A disposable Debian container for testing [Aegis](https://krathos.systems). Comes fully updated, with `curl`, `git` and `vim` installed.

You need Docker with the Compose plugin.

## Steps

1. Build and start the sandbox:

   ```bash
   docker compose up -d --build
   ```

2. Open a shell inside it:

   ```bash
   docker compose exec sandbox bash
   ```

3. Install aegis inside the sandbox. You need your organisation's Aegis URL and an API key from its administrator.

   ```bash
   curl -fsSL https://krathos.systems/install.sh | bash
   ```

4. When you are done, leave the shell with `exit` and remove the sandbox:

   ```bash
   docker compose down
   ```

Everything inside the sandbox is lost when it is removed.
