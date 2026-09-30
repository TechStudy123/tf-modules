# tf-modules

Terraform（1.16 以上）と AWS プロバイダー（6.x）のモジュールです。

| フォルダ | 作るもの |
|---|---|
| network | VPC・公開用サブネット1つ・インターネットゲートウェイ・ルートテーブル |
| web | セキュリティグループ（HTTP）・EC2 1台 |

## 使い方

```hcl
module "network" {
  source = "git::https://github.com/<ユーザー名>/tf-modules.git//network?ref=v1.0.0"

  name = "tfawsops-dev"
  cidr = "10.10.0.0/16"
}
```

- `ref` には、使う版のタグを必ず書きます。
- 入力と出力は、各フォルダの variables.tf・outputs.tf を見てください。
- このリポジトリには、パスワード・アカウントの番号・IP アドレスなどの秘密の情報を書きません。
