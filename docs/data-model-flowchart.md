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

**予約と稼働割当:** 予約Trは稼働割当と**同種の情報を複数内包**する。稼働割当Trは**後続**として別レコードで持ち、**予約・大分類：確定待ち・小分類：予約完了**に至ったタイミングで内包情報から生成する想定（`docs/reservation-status.md`）。図上の `res --- asn` は、この親子・生成元と後続Trの関係を表す。

表示できない場合は、init から `'defaultRenderer': 'elk'` を削除すると dagre に戻る。

## 凡例

| 色 | データタイプ |
|----|----------------|
| 青系 | Acter（Ac） |
| 緑系 | Transaction（Tr） |
| 橙系 | Role |

Entity はノード右上の `en` および Tr/Ac のラベル行で区別する。

## 各データのステータス（フローチャート）

`project-status.md`、`reservation-status.md`、`work-assignment-status.md`、`employee-status.md` に基づく。以下のフローチャートは各 `*-status.md` にも同一内容で掲載する（本節はデータモデル全体の俯瞰用）。

各図は **subgraph のタイトルが大分類**（一覧・レポートのくくり）、**その内側のノードが詳細**（大分類の中の立て付け）である。`docs` 内のステータスドキュメントでも同じ用語で統一する。詳細が未定のときはプレースホルダを1ノード置く。**大分類どうし**の矢印は本流の目安であり、厳密な必須順序は業務ルールで別途定義する。

顧客・BP・営業・PS技術者（Role）については、本リポジトリにステータス一覧ドキュメントはない（社員のみ `employee-status.md`）。

### プロジェクト（Transaction）

大分類は `project-status.md` に準拠。受注と要因確定は同一帯。**受注・要因確定待ち**の小分類は案（順不同・往復可）。**完了待ち**のメンバー管理小分類は同ドキュメント §7.1。クローズ待ちの小分類は別途定義。

```mermaid
flowchart LR
  subgraph p1["大分類: 受注・要因確定待ち（小分類は案・順不同）"]
    direction TB
    p1a[要員予約待ち]
    p1b[要因入力・起票待ち]
    p1c[社内確認・承認待ち]
    p1d[契約・発注手続待ち]
  end
  subgraph p2["大分類: 完了待ち（メンバー管理・§7.1）"]
    direction TB
    p2a[参画待ち]
    p2b[稼働中]
    p2c[補充・代替手配待ち]
  end
  subgraph p3["大分類: クローズ待ち"]
    direction TB
    p3l2[小分類・別途定義]
  end
  p1 --> p2 --> p3
```

### 予約（Transaction）

申請時点の大分類は必ず「確定待ち」から始まる（ドラフトは小分類**作成中**）。詳細は `reservation-status.md`。**確定待ち・予約完了**で稼働割当生成のトリガとする。

```mermaid
flowchart LR
  subgraph r1["大分類: 確定待ち"]
    direction TB
    r1d[作成中]
    r1a[承認待ち]
    r1b[差戻し対応待ち]
    r1c[契約待ち]
    r1e[予約完了]
  end
  subgraph r2["大分類: 確定済み"]
    direction TB
    r2a[顧客合意待ち]
    r2b[予約完了]
  end
  subgraph r3["大分類: 不成立済み（詳細は案）"]
    direction TB
    r3a[解放]
    r3b[却下]
  end
  r1 --> r2
  r1 --> r3
```

### 稼働割当（Transaction）

本流は「稼働待ち→稼働終了待ち→稼働終了」。大分類に**無効**もあり、本流を経ずに遷移しうる（`work-assignment-status.md`）。各大分類の小分類は同ドキュメント §3.5 に従う。

```mermaid
flowchart LR
  subgraph w1["大分類: 稼働待ち"]
    direction TB
    w1a[開始日待ち]
    w1b[準備中]
  end
  subgraph w2["大分類: 稼働終了待ち"]
    direction TB
    w2a[稼働中]
    w2b[更新確認中]
  end
  subgraph w3["大分類: 稼働終了"]
    direction TB
    w3a[稼働終了]
    w3b[途中離脱]
  end
  subgraph w4["大分類: 無効"]
    direction TB
    w4l2[詳細・未定]
  end
  w1 --> w2 --> w3
  w1 -.-> w4
  w2 -.-> w4
```

### 社員（Acter）

すべての社員は、大分類として「起用対象」または「起用対象外」のどちらか一方に必ず属する。人事イベントで大分類・詳細を跨ぐ遷移がありうる（`employee-status.md`）。

```mermaid
flowchart LR
  subgraph act["大分類: 起用対象"]
    direction TB
    e1[起用前]
    e2[在職中]
  end
  subgraph inact["大分類: 起用対象外"]
    direction TB
    e3[休職中]
    e4[退職済]
  end
```
