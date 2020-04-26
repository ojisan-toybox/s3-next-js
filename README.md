# s3-next-js

s3 に Next.js をデプロイ

## memo

### Terraform 設定の前に

AWS CLI の設定

#### S3 の操作権限を持つ IAM 作る

S3

#### AWS CLI の設定

```
# 上で作ったIPASSとregion(ap-northeast-1)を入力
aws configure --profile s3-adder
```
