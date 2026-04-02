# データモデル接続図（Flowchart）

Acter（Ac）、Transaction（Tr）、Role の3タイプで色分けし、Entity には右上に `en` を表示する。接続はリレーション種別なしの無向リンク。タイプ別のサブグラフは使わず、ELK レンダラで配線を整える。

```mermaid
%%{init: {
  'flowchart': {
    'htmlLabels': true,
    'defaultRenderer': 'elk',
    'padding': 24
  }
}}%%
flowchart LR
  classDef ac fill:#cfe8ff,stroke:#1565c0,stroke-width:2px,color:#0d47a1
  classDef tr fill:#d7f5e3,stroke:#2e7d32,stroke-width:2px,color:#1b5e20
  classDef role fill:#ffe8cc,stroke:#e65100,stroke-width:2px,color:#bf360c

  cust["<div style='text-align:center;font-weight:600'>顧客</div><div style='text-align:center;font-size:11px;opacity:.85'>Ac</div>"]
  emp["<div style='font-size:10px;text-align:right'>en</div><div style='text-align:center;font-weight:600'>社員</div><div style='text-align:center;font-size:11px;opacity:.85'>Ac</div>"]
  bp["<div style='font-size:10px;text-align:right'>en</div><div style='text-align:center;font-weight:600'>BP</div><div style='text-align:center;font-size:11px;opacity:.85'>Ac</div>"]
  prj["<div style='font-size:10px;text-align:right'>en</div><div style='text-align:center;font-weight:600'>プロジェクト</div><div style='text-align:center;font-size:11px;opacity:.85'>Tr</div>"]
  res["<div style='font-size:10px;text-align:right'>en</div><div style='text-align:center;font-weight:600'>予約</div><div style='text-align:center;font-size:11px;opacity:.85'>Tr</div>"]
  asn["<div style='font-size:10px;text-align:right'>en</div><div style='text-align:center;font-weight:600'>稼働割当</div><div style='text-align:center;font-size:11px;opacity:.85'>Tr</div>"]
  sls["<div style='text-align:center;font-weight:600'>営業</div><div style='text-align:center;font-size:11px;opacity:.85'>Role</div>"]
  ps["<div style='text-align:center;font-weight:600'>PS技術者</div><div style='text-align:center;font-size:11px;opacity:.85'>Role</div>"]

  prj --- cust
  prj --- res
  prj --- asn
  res --- cust
  res --- asn
  res --- sls
  emp --- sls
  emp --- ps
  bp --- ps
  ps --- prj
  ps --- asn

  class emp,cust,bp ac
  class res,asn,prj tr
  class ps,sls role
```

表示できない場合は、init から `'defaultRenderer': 'elk'` を削除すると dagre に戻る。

## 凡例

| 色 | データタイプ |
|----|----------------|
| 青系 | Acter（Ac） |
| 緑系 | Transaction（Tr） |
| 橙系 | Role |

Entity はノード右上の `en` および Tr/Ac のラベル行で区別する。
