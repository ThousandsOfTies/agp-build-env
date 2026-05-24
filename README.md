# agp-build-env

AgentCockpit 関連の Codespaces/devcontainer 起動用リポジトリです。

Codespaces 起動後、`postCreateCommand` で以下のリポジトリを `repos/` 配下へ clone します。

- `ThousandsOfTies/agp-tools`
- `ThousandsOfTies/embedded-poc-app`

## Layout After Codespaces Setup

```text
agp-build-env/
  repos/
    agp-tools/
    embedded-poc-app/
```

## Manual Setup

Codespaces 外で同じ構成にしたい場合:

```bash
bash scripts/post-create.sh
```
