# Cloud-Only Development with Orca + GitHub Codespaces

Work on this repository without ever running `git clone` on your laptop. The
source stays in a GitHub Codespace; your local Orca Desktop app drives that
remote runtime over an authenticated, forwarded port.

**You will never download the source. You do need the Orca Desktop app.**

---

## 1. Start the Codespace

1. Open <https://github.com/SURPL-GRP/SURPL-GRP.github.io>.
2. **Code** → **Codespaces** tab → **Create codespace on `main`**.
3. Wait for the build. On first creation it installs the Orca runtime, the
   Python toolchain, Tesseract, Poppler and a Chromium build, so the first run
   takes a few minutes. Later starts are fast.

When it finishes, the terminal prints a banner containing a **pairing URL**
(`orca://pair?code=...`). Keep it — you need it in step 3.

Lost it? In the Codespace terminal:

```bash
cat /tmp/orca-serve.log
```

Restart the runtime if it is not listening:

```bash
bash .devcontainer/orca-serve.sh
```

---

## 2. Bridge port 6768 to your laptop

The runtime listens on **6768** inside the Codespace. Forward it locally —
pick either method.

### Option A — GitHub CLI (no VS Code needed)

```bash
gh codespace ports forward 6768:6768 --codespace <codespace-name>
```

Find `<codespace-name>` with `gh codespace list`. Leave the command running;
it holds the tunnel open.

### Option B — VS Code Desktop

1. Install the **GitHub Codespaces** extension.
2. `Ctrl/Cmd+Shift+P` → **Codespaces: Connect to Codespace** → pick yours.
3. Open the **Ports** panel. `6768` is forwarded automatically and labelled
   *Orca runtime*.
4. Confirm **Visibility** reads **Private**.

> **Port 6768 must stay Private.** Orca's own documentation is explicit: *"Do
> not forward the Orca port directly to the public internet. Prefer Tailscale,
> WireGuard, a trusted LAN, SSH forwarding, or an authenticated tunnel."*
> Codespaces forwarding is an authenticated tunnel and defaults to private, so
> the safe path is simply never to switch it to Public.

Verify the bridge before moving on:

```bash
curl -sS -o /dev/null -w '%{http_code}\n' http://127.0.0.1:6768
```

Any HTTP response means the tunnel is up. Connection refused means it is not —
recheck step 2.

---

## 3. Connect the Orca Desktop app

1. Open **Orca Desktop** on your laptop.
2. **Settings → Remote Orca Servers**.
3. **Add Server**.
4. **Name**: something like `SURPL-GRP.github.io codespace`.
5. **Pairing URL**: paste the `orca://pair?code=...` URL from step 1.
6. **Add Server**, then select it to switch to the remote runtime.

> Paste the **pairing URL**, not `http://127.0.0.1:6768`. The address alone
> carries no credential; the runtime authenticates clients with the pairing
> code embedded in that URL. The plain address will not connect.

Prefer the CLI? Same thing:

```bash
orca environment add --name SURPL-GRP.github.io-codespace --pairing-code 'orca://pair?code=...'
orca environment list
```

Once connected, your local Orca window is driving the Codespace: worktrees,
terminals, agents and diffs all execute there. Nothing is cloned locally.

---

## Troubleshooting

| Symptom | Cause | Fix |
| --- | --- | --- |
| Desktop app cannot connect | Tunnel not running | Re-run step 2; the `gh` command must stay open |
| `connection refused` on 6768 | Runtime not started | `bash .devcontainer/orca-serve.sh` in the Codespace |
| Pairing URL rejected | Code expired with the old container | Restart the runtime, use the fresh URL |
| Forwarded to a port other than 6768 | 6768 busy locally | Free it — the pairing address is fixed to `127.0.0.1:6768` |
| Codespace stopped overnight | Idle timeout | Restart it; `postStartCommand` restarts the runtime and prints a new pairing URL |

---

## Notes for administrators

- **Port visibility cannot be pinned in `devcontainer.json`.** `visibility` is
  not part of the spec — `portsAttributes` accepts only `label`, `protocol`,
  `onAutoForward`, `requireLocalPort` and `elevateIfNeeded`. Private is the
  Codespaces default; to *enforce* it, set the organisation's Codespaces port
  visibility policy at
  `https://github.com/organizations/SURPL-GRP/settings/codespaces`.
- **`requireLocalPort` is load-bearing.** The runtime advertises
  `127.0.0.1:6768` to clients, so the local end of the tunnel must be exactly
  6768.
- **Running Orca headless in a container is not vendor-documented.** Orca's
  docs cover remote servers on VMs but say nothing about Docker, devcontainers
  or Codespaces. Validate the flow on one Codespace before rolling it out.
- **This controls convenience, not exfiltration.** Anyone who can open a
  terminal in the Codespace can still read and copy the source. It removes
  laptop-resident clones; it is not a data-loss-prevention boundary.
