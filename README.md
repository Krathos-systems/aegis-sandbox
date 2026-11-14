# Aegis Sandbox

A disposable Debian container for testing [Aegis](https://krathos.systems). Comes fully updated, with `curl`, `git`, `vim`, Claude Code already installed.

You need Docker with the Compose plugin, your organisation's Aegis address, and an API key starting with `aeg_` from your administrator.

## Steps

1. Build and start the sandbox:

   ```bash
   docker compose up -d --build
   ```

2. Open a shell inside it:

   ```bash
   docker compose exec sandbox bash
   ```

3. Install aegis. It installs the `aegis` command and its Claude Code plugin:

   ```bash
   curl -fsSL https://github.com/Krathos-systems/aegis-cli/releases/latest/download/install.sh | bash
   ```

4. Log in to Aegis. It asks for your Aegis address and your API key:

   ```bash
   aegis login
   ```

5. Clone a repository and set it up.

   ```bash
   git clone <your-repo-url>
   cd <your-repo>
   aegis init
   ```

6. Check it worked. No line should say `FAIL`:

   ```bash
   aegis doctor
   ```

7. Start Claude Code in the repository and log in when it asks:

   ```bash
   claude
   ```

8. When you are done, leave the shell with `exit` and remove the sandbox:

   ```bash
   docker compose down
   ```
