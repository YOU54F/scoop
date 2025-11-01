# Pact cli tools via scoop

[![CI](https://github.com/pact-foundation/scoop/actions/workflows/ci.yml/badge.svg)](https://github.com/pact-foundation/scoop/actions/workflows/ci.yml)
[![Tests](https://github.com/pact-foundation/scoop/actions/workflows/tests.yml/badge.svg)](https://github.com/pact-foundation/scoop/actions/workflows/tests.yml)

[Pact CLI Tools](https://docs.pact.io/implementation_guides/cli) bucket for [Scoop](https://scoop.sh), the Windows command-line installer.

## Supported Platforms

| OS      | Architecture | Supported  |
| ------- | ------------ | ---------  |
| Windows | x86_64       |   ✅       |
| Windows | aarch64      |   ✅       |

How do I install these manifests?
---------------------------------

```powershell
# Unified CLI
scoop bucket add pact https://github.com/pact-foundation/scoop
scoop install pact

# Individual tools
scoop install pact-mock-server
scoop install pact-stub-server
scoop install pact-verifier
scoop install pact-plugin
scoop install pact-broker-client
scoop install pact-legacy
```

### GitHub Actions Example

```yml
- name: Install Pact via Scoop
  if: runner.os == 'Windows'
  shell: powershell
  run: |
    scoop bucket add pact https://github.com/pact-foundation/scoop
    scoop install pact
    scoop search pact
    pact --help
```

## Creating new manifests

Run the following command, replacing variables

```sh
TOOL_NAME=<tool name> ./scripts/create_bucket.sh <TAG>
```

Examples

```sh
TOOL_NAME=pact_mock_server_cli ./scripts/create_bucket.sh pact_mock_server_cli-v2.0.0
TOOL_NAME=pact-plugin-cli ./scripts/create_bucket.sh pact-plugin-cli-v0.2.0
TOOL_NAME=pact-stub-server ./scripts/create_bucket.sh v0.7.0
TOOL_NAME=pact-cli ./scripts/create_bucket.sh v0.9.1
TOOL_NAME=pact-broker-cli ./scripts/create_bucket.sh v0.5.0
TOOL_NAME=pact_verifier_cli ./scripts/create_bucket.sh pact_verifier_cli-v1.3.0
TOOL_NAME=pact-legacy ./scripts/create_bucket.sh v2.5.6
```
