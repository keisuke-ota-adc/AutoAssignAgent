# Hackolade データモデル（Mermaid）

`AutoAssignAgent_Model.hck.json` のコレクション・外部キー関係を Mermaid で表現したもの。

## 1. ER 図（主要エンティティと FK）

`erDiagram` ではハイフンを含む名前を避け、`Staff-Status` は `Staff_Status` としている。`Sub_Status__StaffingOrder` は `Sub_Status_StaffingOrder` と表記。

```mermaid
erDiagram
  WorkAssignment {
    string Id PK
    string StaffingOrder_Id FK
    string Poject_Id FK
    string Staff_Id FK
    string Main_Status FK
    string Sub_Status FK
  }
  StaffingOrder {
    string Id PK
    string Project_Id FK
    string Main_Status FK
    string Sub_Status FK
  }
  Project {
    string Id PK
    string Sales_Employee_Id FK
    string Main_Status FK
    string Sub_Status FK
  }
  Employee {
    string Id PK
    string Staff_Id FK
    string Role_Id FK
  }
  Business_Partner {
    string Id PK
    string Staff_Id FK
    string Role_Id FK
  }
  Staff {
    string Id PK
    string Role_Id FK
  }
  Role {
    string Id PK
  }
  Main_Status_StaffingOrder {
    string Id PK
  }
  Sub_Status_StaffingOrder {
    string Id PK
    string Main_Status_Id FK
  }
  Main_Status_Project {
    string Id PK
  }
  Sub_Status_Project {
    string Id PK
    string Main_Status_Id FK
  }
  Main_Status_WorkAssignment {
    string Id PK
  }
  Sub_Status_WorkAssignment {
    string Id PK
    string Main_Status_Id FK
  }
  Status_Staff {
    string Id PK
  }
  Staff_Status {
    string Id PK
    string Staff_Id FK
    string Status_Id FK
  }

  StaffingOrder }o--|| Project : "Project_Id"
  Project }o--o| Employee : "Sales_Employee_Id"
  WorkAssignment }o--|| StaffingOrder : "StaffingOrder_Id"
  WorkAssignment }o--|| Project : "Poject_Id"
  WorkAssignment }o--|| Staff : "Staff_Id"
  Employee }o--|| Role : "Role_Id"
  Employee }o--o| Staff : "Staff_Id"
  Business_Partner }o--|| Role : "Role_Id"
  Business_Partner }o--o| Staff : "Staff_Id"
  Staff }o--|| Role : "Role_Id"
  StaffingOrder }o--|| Staff : "Staff_Resource_List.Staff_Id"
  StaffingOrder }o--|| Role : "Staff_Resource_List.Role_Id"
  Sub_Status_StaffingOrder }o--|| Main_Status_StaffingOrder : "Main_Status_Id"
  StaffingOrder }o--|| Main_Status_StaffingOrder : "Main_Status"
  StaffingOrder }o--|| Sub_Status_StaffingOrder : "Sub_Status"
  Project }o--|| Main_Status_Project : "Main_Status"
  Project }o--|| Sub_Status_Project : "Sub_Status"
  Sub_Status_Project }o--|| Main_Status_Project : "Main_Status_Id"
  WorkAssignment }o--|| Main_Status_WorkAssignment : "Main_Status"
  WorkAssignment }o--|| Sub_Status_WorkAssignment : "Sub_Status"
  Sub_Status_WorkAssignment }o--|| Main_Status_WorkAssignment : "Main_Status_Id"
  Staff_Status }o--|| Staff : "Staff_Id"
  Staff_Status }o--|| Status_Staff : "Status_Id"
```

## 2. ドメイン（バケット）別の俯瞰

Hackolade の `buckets`（要員・予約・プロジェクト・稼働割当）に合わせた配置。エンティティ間の接続は上記 FK と同じ。

```mermaid
flowchart TB
  subgraph B1["要員（スタッフ）"]
    direction TB
    Employee
    Role
    Staff
    Business_Partner
    Status_Staff
    Staff_Status
  end
  subgraph B2["予約"]
    direction TB
    StaffingOrder
    Main_Status_StaffingOrder
    Sub_Status_StaffingOrder
  end
  subgraph B3["プロジェクト"]
    direction TB
    Project
    Main_Status_Project
    Sub_Status_Project
  end
  subgraph B4["稼働割当"]
    direction TB
    WorkAssignment
    Main_Status_WorkAssignment
    Sub_Status_WorkAssignment
  end

  StaffingOrder --> Project
  Project --> Employee
  WorkAssignment --> StaffingOrder
  WorkAssignment --> Project
  WorkAssignment --> Staff
  Employee --> Role
  Employee --> Staff
  Business_Partner --> Role
  Business_Partner --> Staff
  Staff --> Role
  StaffingOrder --> Staff
  StaffingOrder --> Role
  Sub_Status_StaffingOrder --> Main_Status_StaffingOrder
  StaffingOrder --> Main_Status_StaffingOrder
  StaffingOrder --> Sub_Status_StaffingOrder
  Project --> Main_Status_Project
  Project --> Sub_Status_Project
  Sub_Status_Project --> Main_Status_Project
  WorkAssignment --> Main_Status_WorkAssignment
  WorkAssignment --> Sub_Status_WorkAssignment
  Sub_Status_WorkAssignment --> Main_Status_WorkAssignment
  Staff_Status --> Staff
  Staff_Status --> Status_Staff
```

## 3. 補足

- `Project`、`StaffingOrder`、`WorkAssignment` などは JSON 定義 `Period` および `Monthly_Allocation` を参照する埋め込み型を持つ。上図ではリレーション線の見やすさのため省略。
- `WorkAssignment.Poject_Id` は Hackolade 上のスペル（`Project` の誤記）のまま。
- `StaffingOrder` の `Staff_Resource_List` 内ネストに対する `Staff` / `Role` への FK は、ER 図では1本の関係として圧縮して記載している。
