# pact-cli

Pact CLI Tools

## Scoop

[![Tests](https://github.com/you54f/pact/actions/workflows/ci.yml/badge.svg)](https://github.com/you54f/pact/actions/workflows/ci.yml) [![Excavator](https://github.com/you54f/pact/actions/workflows/excavator.yml/badge.svg)](https://github.com/you54f/pact/actions/workflows/excavator.yml)

bucket for [Scoop](https://scoop.sh), the Windows command-line installer.

How do I install these manifests?
---------------------------------

To add this bucket, run `scoop bucket add pact https://github.com/you54f/pact`.

### Pact

To install, do `scoop install pact`.

Contains a bundle with

- Pact-Ruby-Standalone
  - pact.bat ()
  - pact-broker.bat
  - pact-message.bat
  - pact-mock-service.bat
  - pact-provider-verifier.bat
  - pact-stub-service.bat
  - pactflow.bat

| OS     | Ruby      | Architecture | Supported |
| -------| ------- | ------------ | --------- |
| Windows| 3.2.2 | x86_64       | ✅        |
| Windows| 3.2.2 | aarch64 (via x86 emulation) |  ✅        |

- pact-plugin-cli.exe
- pact_verifier_cli.exe
- pact_mock_server_cli.exe

| OS     | Ruby      | Architecture | Supported |
| -------| ------- | ------------ | --------- |
| Windows| 3.2.2 | x86_64       | ✅        |
| Windows| 3.2.2 | aarch64 (via x86 emulation) |  ✅        |


How do I contribute new manifests?
----------------------------------

To make a new manifest contribution, please read the [Contributing Guide](https://github.com/you54f/.github/blob/main/.github/CONTRIBUTING.md).

----