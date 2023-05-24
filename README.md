# pact-cli

Pact CLI Tools

## Scoop

### Supported Platforms

| OS      | Architecture                | Supported  |
| ------- | ------------                | ---------  |
| Windows | x86_64                      |   ✅       |
| Windows | aarch64 (via x86 emulation) |   ✅       |

[![Tests](https://github.com/you54f/pact/actions/workflows/ci.yml/badge.svg)](https://github.com/you54f/pact/actions/workflows/ci.yml) [![Excavator](https://github.com/you54f/pact/actions/workflows/excavator.yml/badge.svg)](https://github.com/you54f/pact/actions/workflows/excavator.yml)

bucket for [Scoop](https://scoop.sh), the Windows command-line installer.

How do I install these manifests?
---------------------------------

To add this bucket, run:

`scoop bucket add pact https://github.com/you54f/scoop`

Search the bucket for available pact cli tools

`scoop search pact`

| Name                   |Version| Source
| ----                   |-------| ------
| pact                   |0.0.3  | pact
| pact_mock_server_cli   |1.0.0  | pact
| pact_mock_server_cli@1 |1.0.0  | pact
| pact_verifier_cli      |0.10.6 | pact
| pact_verifier_cli@0    |0.10.6 | pact
| pact-ruby-standalone   |2.0.1  | pact
| pact-ruby-standalone@1 |1.92.0 | pact
| pact-ruby-standalone@2 |2.0.1  | pact

Install all the tools, do `scoop install pact`.

Contains a bundle with

- Pact-Ruby-Standalone
  - pact
  - pact-broker
  - pact-message
  - pact-mock-service
  - pact-provider-verifier
  - pact-stub-service
  - pactflow
  - pact-plugin-cli

You can also install the following tools separately

<!-- - pact-plugin-cli -->
- pact_verifier_cli
- pact_mock_server_cli

How do I contribute new manifests?
----------------------------------

To make a new manifest contribution, please read the [Contributing Guide](https://github.com/you54f/.github/blob/main/.github/CONTRIBUTING.md).

----
