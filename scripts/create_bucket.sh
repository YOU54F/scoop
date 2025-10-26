#!/bin/bash

# REPO=${REPO:-https://github.com/pact-foundation/pact-reference.git}
TOOL_NAME=${TOOL_NAME:-pact-mock-server}
download_and_checksum() {
  rm -f $1
  echo "⬇️  Downloading $version :\t $1"
  gh release download --repo $REPO $tag -p $1
  shasignature=($(eval "openssl dgst -sha256 $1"))
  echo "🔏 Checksum SHA256:\t ${shasignature[1]} for ${1}"
  rm -f $1
}

if [[ $TOOL_NAME == 'pact_mock_server_cli' ]]; then
  description="Installer for the Pact Mock Server CLI"
  homepage="https://github.com/pact-foundation/pact-reference/blob/master/rust/pact_mock_server_cli/README.md"
  location="https://github.com/you54f/pact-core-mock-server"
  license="MIT"
  bin='"pact-mock-server.exe"'
  REPO=you54f/pact-core-mock-server
elif [[ $TOOL_NAME == 'pact_verifier_cli' ]]; then
  description="Installer for the Pact Verifier CLI"
  homepage="https://github.com/pact-foundation/pact-reference/blob/master/rust/pact_verifier_cli/README.md"
  location="https://github.com/you54f/pact-reference"
  license="MIT"
  bin='"pact-verifier.exe"'
  REPO=you54f/pact-reference
elif [[ $TOOL_NAME == 'pact-plugin-cli' ]]; then
  description="Installer for the Pact Plugin CLI"
  homepage="https://github.com/pact-foundation/pact-plugins/blob/main/cli/README.md"
  location="https://github.com/you54f/pact-plugins"
  license="MIT"
  bin='"pact-plugin.exe"'
  REPO=you54f/pact-plugins
elif [[ $TOOL_NAME == 'pact-stub-server' ]]; then
  description="Installer for the Pact Stub Server"
  homepage="https://github.com/pact-foundation/pact-stub-server/blob/master/README.md"
  location="https://github.com/you54f/pact-stub-server"
  license="MIT"
  bin='"pact-stub-server.exe"'
  REPO=you54f/pact-stub-server
elif [[ $TOOL_NAME == 'pact-broker-cli' ]]; then
  description="Installer for the Pact Broker Client"
  homepage="https://github.com/pact-foundation/pact-broker-cli/blob/main/README.md"
  location="https://github.com/pact-foundation/pact-broker-cli"
  license="MIT"
  bin='"pact-broker-client.exe"'
  REPO=pact-foundation/pact-broker-cli
elif [[ $TOOL_NAME == 'pact-cli' ]]; then
  description="Installer for the Pact Cli"
  homepage="https://github.com/you54f/pact-cli/blob/main/README.md"
  location="https://github.com/you54f/pact-cli"
  license="MIT"
  bin='"pact-cli.exe"'
  REPO=you54f/pact-cli
elif [[ $TOOL_NAME == 'pact-ruby-standalone' ]]; then
  description="Installer for the Pact Ruby Standalone"
  homepage="https://github.com/pact-foundation/ruby-standalone/README.md"
  location="https://github.com/you54f/pact-standalone"
  license="MIT"
  bin='"pact\\bin\\pact-broker.bat","pact\\bin\\pact-stub-service.bat","pact\\bin\\pact-message.bat","pact\\bin\\pact-provider-verifier.bat","pact\\bin\\pact.bat","pact\\bin\\pact-mock-service.bat","pact\\bin\\pact-publish.bat","pact\\bin\\pactflow.bat"'
  REPO=you54f/pact-standalone
fi

if [[ $1 ]]; then
  tags=($1)
else
  if [[ $TOOL_NAME == 'pact-ruby-standalone' ]]; then

    tags=$(gh release list --repo $REPO --limit 1000 | cut -f3)
  else
    echo gh release list --repo $REPO --limit 1000 | cut -f3 
    tags=$(gh release list --repo $REPO --limit 1000 | cut -f3 | grep -e $TOOL_NAME)
  fi
fi

for tag in ${tags[@]}; do
    if [[ $TOOL_NAME == 'pact-ruby-standalone' ]]; then
    SCOOP_FILENAME=pact-ruby-standalone-$tag.json
  else
    SCOOP_FILENAME=$tag.json
  fi
  version=${tag#v}
  echo creating tap for $version
  echo release assets
  echo $(gh release view --repo $REPO $tag --json assets | jq -r '[.assets[].name]')
  #   macos_x64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep -E 'osx|apple|darwin' | grep x86_64 | grep -v 'checksum' | grep -v 'sha256')
  #     echo "macos_x64: $macos_x64"
  #   if [[ -z $macos_x64 ]]; then
  #     macos_x64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep -E 'osx|apple|darwin' | grep -v 'checksum' | grep -v 'sha256')
  #       echo "macos_x64: $macos_x64"

  #   fi
  #   echo 'foo1'
  #   macos_arm64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep -E 'osx|apple|darwin' | grep -E 'arm64|aarch64'| grep -v 'checksum' | grep -v 'sha256')
  #   echo 'foo'
  #   if [[ -z $macos_arm64 && $macos_x64 ]]; then

  #     macos_arm64=$macos_x64
  #     echo "no arm, so setting macos_arm64 to x64: $macos_arm64"
  #   fi
  #   linux_arm64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep linux | grep -E 'arm64|aarch64' | grep -v 'checksum' | grep -v 'sha256')
  # echo "linux_arm64: $linux_arm64"
  #   linux_x64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep linux | grep x86_64 | grep -v 'checksum' | grep -v 'sha256')
  #   echo "linux_x64: $linux_x64"
  windows_arm64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep 'windows' | grep -E 'arm64|aarch64' | grep -v 'checksum' | grep -v 'sha256')
  echo "windows_arm64: $windows_arm64"
  windows_x64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep 'windows' | grep x86_64 | grep -v 'checksum' | grep -v 'sha256')
  if [[ $TOOL_NAME == 'pact-cli' || $TOOL_NAME == 'pact-broker-cli' ]]; then
    windows_x64=$(echo "$windows_x64" | grep 'msvc')
  fi
  echo "windows_x64: $windows_x64"
  windows_x86=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep 'windows' | grep -e 'x86\.' | grep -v 'checksum' | grep -v 'sha256')
  echo "windows_x86: $windows_x86"
  if [[ -z $windows_x64 && -z $windows_x86  ]]; then
      windows_x64=$(gh release view --repo $REPO $tag --json assets -q '.assets[].name' | grep 'win32' | grep -v 'checksum' | grep -v 'sha256')
  fi

  echo "macos_x64: $macos_x64"
  echo "macos_arm64: $macos_arm64"
  if [[ $macos_arm64 || $macos_x64 || $linux_arm64 || $linux_x64 || $windows_arm64 || $windows_x64 || $windows_x86 ]]; then

    if [[ $macos_arm64 || $macos_x64 ]]; then
      if [[ $macos_arm64 ]]; then
        download_and_checksum $macos_arm64
        macos_arm64_shashum=${shasignature[1]}
        macos_arm64_url="$location/releases/download/$tag/$macos_arm64"
        echo "👮‍♀️ Checksum SHA256:\t $macos_arm64_shashum"
      fi
      if [[ $macos_x64 ]]; then
        download_and_checksum $macos_x64
        macos_x64_shashum=${shasignature[1]}
        macos_x64_url="$location/releases/download/$tag/$macos_x64"
        echo "👮‍♀️ Checksum SHA256:\t $macos_x64_shashum"
      fi
    fi
    if [[ $linux_arm64 || $linux_x64 ]]; then
      if [[ $linux_arm64 ]]; then
        download_and_checksum $linux_arm64
        linux_arm64_shashum=${shasignature[1]}
        linux_arm64_url="$location/releases/download/$tag/$linux_arm64"
        echo "👮‍♀️ Checksum SHA256:\t $linux_arm64_shashum"
      fi
      if [[ $linux_x64 ]]; then
        download_and_checksum $linux_x64
        linux_x64_shashum=${shasignature[1]}
        linux_x64_url="$location/releases/download/$tag/$linux_x64"
        echo "👮‍♀️ Checksum SHA256:\t $linux_x64_shashum"
      fi
    fi
    if [[ $windows_arm64 || $windows_x64 || $windows_x86 ]]; then
      if [[ $windows_arm64 ]]; then
        download_and_checksum $windows_arm64
        windows_arm64_shashum=${shasignature[1]}
        windows_arm64_url="$location/releases/download/$tag/$windows_arm64"
        echo "👮‍♀️ Checksum SHA256:\t $windows_arm64_shashum"
      fi
      if [[ $windows_x64 ]]; then
        download_and_checksum $windows_x64
        windows_x64_shashum=${shasignature[1]}
        windows_x64_url="$location/releases/download/$tag/$windows_x64"
        echo "👮‍♀️ Checksum SHA256:\t $windows_x64_shashum"
      fi
      if [[ $windows_x86 ]]; then
      echo "windows_x86: $windows_x86"
        download_and_checksum $windows_x86
        windows_x86_shashum=${shasignature[1]}
        windows_x86_url="$location/releases/download/$tag/$windows_x86"
        echo "👮‍♀️ Checksum SHA256:\t $windows_x86_shashum"
      fi
    fi

  fi

  # --arg mac_a_sha256 "$macos_arm64_shashum" \
  # --arg mac_a_url "$macos_arm64_url" \
  # --arg mac_a_name "$macos_arm64" \
  # --arg mac_x_sha256 "$macos_x64_shashum" \
  # --arg mac_x_url "$macos_x64_url" \
  # --arg mac_x_name "$macos_x64" \
  # --arg lin_a_sha256 "$linux_arm64_shashum" \
  # --arg lin_a_url "$linux_arm64_url" \
  # --arg lin_a_name "$linux_arm64" \
  # --arg lin_x_sha256 "$linux_x64_shashum" \
  # --arg lin_x_url "$linux_x64_url" \
  # --arg lin_x_name "$linux_x64" \

  if [[ $windows_x64_shashum ]]; then
    SCOOP_X64_TEMPLATE=\"64bit\":{\"url\":[\"$windows_x64_url\"],\"hash\":[\"$windows_x64_shashum\"],\"bin\":[$bin]}
    else
    SCOOP_X64_TEMPLATE=""
  fi
  if [[ $windows_arm64_shashum ]]; then
    SCOOP_ARM64_TEMPLATE=,\"arm64\":{\"url\":[\"$windows_arm64_url\"],\"hash\":[\"$windows_arm64_shashum\"],\"bin\":[$bin]}
    else SCOOP_ARM64_TEMPLATE=,\"arm64\":{}
  fi
  if [[ $windows_x86_shashum ]]; then
    SCOOP_X86_TEMPLATE=,\"32bit\":{\"url\":[\"$windows_x86_url\"],\"hash\":[\"$windows_x86_shashum\"],\"bin\":[$bin]}
    echo $windows_x86_url
    echo $SCOOP_X86_TEMPLATE
    else SCOOP_X86_TEMPLATE=,\"32bit\":{}
  fi


  SCOOP_STRING=$(jq -n \
    --arg description "$description" \
    --arg homepage "$homepage" \
    --arg license "$license" \
    --arg tag "${version#$TOOL_NAME-v}" \
    --arg bin $bin \
    --arg SCOOP_X64_TEMPLATE $SCOOP_X64_TEMPLATE \
    --arg SCOOP_X86_TEMPLATE $SCOOP_X86_TEMPLATE \
    --arg SCOOP_ARM64_TEMPLATE $SCOOP_ARM64_TEMPLATE \
    '{version: $tag,description: $description,homepage: $homepage,license: $license,architecture: {'$SCOOP_X64_TEMPLATE''$SCOOP_X86_TEMPLATE''$SCOOP_ARM64_TEMPLATE'}}')
  # '{macos:{arm64:{sha256:$mac_a_sha256,url:$mac_a_url,name:$mac_a_name},amd64:{sha256:$mac_x_sha256,url:$mac_x_url,name:$mac_x_name}},linux:{arm64:{sha256:$lin_a_sha256,url:$lin_a_url,name:$lin_a_name},amd64:{sha256:$lin_x_sha256,url:$lin_x_url,name:$lin_x_name}},windows:{arm64:{sha256:$win_a_sha256,url:$win_a_url,name:$win_a_name},amd64:{sha256:$win_x_sha256,url:$win_x_url,name:$win_x_name}}}' )
  echo $SCOOP_STRING >$SCOOP_FILENAME


done
