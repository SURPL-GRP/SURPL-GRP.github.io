#!/usr/bin/env bash
# Start the headless Orca runtime.
#
# Backgrounded deliberately. `orca serve --help` says it "Runs in the foreground
# ... Stop it with Ctrl+C", and devcontainer lifecycle scripts run in sequence --
# a foreground server in postStartCommand would hang Codespace startup forever.
set -euo pipefail

PORT="${ORCA_PORT:-6768}"
LOG="${ORCA_LOG:-/tmp/orca-serve.log}"

if pgrep -f "orca serve --port ${PORT}" >/dev/null 2>&1; then
  echo "Orca runtime already listening on ${PORT}."
  exit 0
fi

# --pairing-address sets the address advertised to the CLIENT, not the bind
# address (`orca serve --help`: "changes only the client-advertised address").
# Because the Codespace forwards 6768 to the developer's own loopback, the
# address the desktop app must dial really is 127.0.0.1 -- which is why
# requireLocalPort is set for 6768 in devcontainer.json.
nohup orca serve --port "${PORT}" --pairing-address 127.0.0.1 >"${LOG}" 2>&1 &

for _ in $(seq 1 30); do
  if grep -qiE 'orca://pair|pairing' "${LOG}" 2>/dev/null; then break; fi
  sleep 1
done

echo
echo "──────────────────────────────────────────────────────────────"
echo " Orca runtime on port ${PORT}. Pairing details:"
echo "──────────────────────────────────────────────────────────────"
cat "${LOG}" || true
echo "──────────────────────────────────────────────────────────────"
echo " Copy the pairing URL above into your desktop app:"
echo "   Settings -> Remote Orca Servers -> Add Server"
echo " Full walkthrough: ORCA_CODESPACE_SETUP.md"
echo " Re-read this later with:  cat ${LOG}"
echo
