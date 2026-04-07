     

### <a id="documentation-body"></a>

![Hackolade image](AutoAssignAgent_DataModel/image1.png?raw=true)

Polyglot Physical Model
-----------------------

#### Schema for:

Model name: New model

Author:

Version:

File name: AutoAssignAgent\_Model.hck (3).json

File path: C:\\Users\\KeisukeOta\\Downloads\\AutoAssignAgent\_Model.hck (3).json

Printed On: Tue Apr 07 2026 17:15:56 GMT+0900 (日本標準時)

Created with: [Hackolade](https://hackolade.com/) - Polyglot data modeling for NoSQL databases, storage formats, REST APIs, and JSON in RDBMS

### <a id="contents"></a>

*   [Table of Contents](#contents)
*   [1\. Model](#model)
*   [2\. Containers](#containers)
    *   [2.1 要員（スタッフ）](#16e6b351-03a2-4495-a5cb-318758a14203)
        
        [2.1.2. Entities](#16e6b351-03a2-4495-a5cb-318758a14203-children)
        
        [2.1.2.1 Employee](#7722533f-7242-4c5a-9535-44e7c539fb6f)
        
        [2.1.2.1.4. Child entities](#7722533f-7242-4c5a-9535-44e7c539fb6f-children)
        
        [2.1.2.2 Role](#2ffada2e-93f5-4524-a1b8-5164c9f84f7e)
        
        [2.1.2.2.4. Child entities](#2ffada2e-93f5-4524-a1b8-5164c9f84f7e-children)
        
        [2.1.2.3 Staff](#8e985525-5bf1-4633-945a-35054a47d5e1)
        
        [2.1.2.4 Business\_Partner](#2be3c97d-483a-474f-b219-cfbabfe4e88f)
        
        [2.1.2.5 Status\_Staff](#ca58d02a-a7f1-4aa8-b8a3-617b1324047f)
        
        [2.1.2.6 StaffStatus](#385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0)
        
    *   [2.2 予約](#11479816-59ea-4786-960c-f43dc4bb45a4)
        
        [2.2.2. Entities](#11479816-59ea-4786-960c-f43dc4bb45a4-children)
        
        [2.2.2.1 StaffingOrder](#465ab053-9432-4c43-82ae-b0457f3c35cc)
        
        [2.2.2.1.4. Child entities](#465ab053-9432-4c43-82ae-b0457f3c35cc-children)
        
        [2.2.2.2 StaffingOrderStaffResource](#a1b2c3d4-e5f6-4789-a012-345678901001)
        
        [2.2.2.3 StaffingOrderStaffResourceMonthlyAllocation](#a1b2c3d4-e5f6-4789-a012-345678901021)
        
        [2.2.2.4 Main\_Status\_StaffingOrder](#d3cc3aa9-6ec9-4409-b35b-01cae6352f56)
        
        [2.2.2.5 Sub\_Status\_StaffingOrder](#83f1137b-4e38-4a42-b17d-89d969485107)
        
    *   [2.3 プロジェクト](#31bd3274-d6cc-4b12-b16a-bebd0547d2a7)
        
        [2.3.2. Entities](#31bd3274-d6cc-4b12-b16a-bebd0547d2a7-children)
        
        [2.3.2.1 Project](#b351e292-4128-4bb7-91c6-4b0c069dec74)
        
        [2.3.2.2 Main\_Status\_Project](#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f)
        
        [2.3.2.3 Sub\_Status\_Project](#427cb85d-c62e-4bf3-a7f2-69cbee6f56d5)
        
    *   [2.4 稼働割当](#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee)
        
        [2.4.2. Entities](#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee-children)
        
        [2.4.2.1 WorkAssignment](#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3)
        
        [2.4.2.2 WorkAssignmentMonthlyAllocation](#a1b2c3d4-e5f6-4789-a012-345678901041)
        
        [2.4.2.3 Main\_Status\_WorkAssignment](#b960eb07-bdd2-4298-9069-8ae51c9d735d)
        
        [2.4.2.4 Sub\_Status\_WorkAssignment](#e86ef3e8-5f88-4613-b6ce-050fc5ae40c7)
        
*   [3\. Relationships](#relationships)
    *   [3.1 fk StaffingOrder.ProjectId to Project.Id](#dcca2278-19b4-4f37-a024-4261a85c6705)
    *   [3.2 fk Project.Sales\_Employee\_Id to Employee.Id](#d707681d-a84e-4cd5-8873-e1560995d533)
    *   [3.3 fk WorkAssignment.StaffingOrder\_Id to StaffingOrder.Id](#5f2cb9b8-7e99-406b-8c82-ea1f95e89138)
    *   [3.4 fk Employee.Role\_Id to Role.Id](#7f58d1b6-2468-42b5-be05-48e875c1ba17)
    *   [3.5 fk WorkAssignment.Project\_Id to Project.Id](#2c4204af-454c-4326-83d1-0b69bf11ef43)
    *   [3.6 fk Staff.Role\_Id to Role.Id](#4f06ee06-921e-4c86-b96f-8a97ab8023bb)
    *   [3.7 fk Employee.Staff\_Id to Staff.Id](#5fb50e3a-7ee8-40af-b725-c39f266d22a2)
    *   [3.8 fk Employee.Role\_Id to Role.Id](#9d315ea1-5b60-4f4d-b542-dc80d60de36c)
    *   [3.9 fk Employee.Staff\_Id to Staff.Id](#898b0089-d41a-47a7-84f6-fc3473741671)
    *   [3.10 fk Staff.Id to WorkAssignment.Staff\_Id](#2343d276-8a20-43ff-8c4a-2b94d2835be6)
    *   [3.11 fk Sub\_Status.Main\_Status\_Id to Main\_Status.Id](#415a9e32-a353-4ed3-bbf2-57531e5a7ad3)
    *   [3.12 fk Main\_Status.Id to StaffingOrder.Main\_Status](#39b9ed50-d1f8-4148-8a5a-dc099d2cfc45)
    *   [3.13 fk Sub\_Status.Id to StaffingOrder.Sub\_Status](#5dde96c3-c44e-4ad0-8117-cb0c2064de1f)
    *   [3.14 fk Main\_Status.Id to Project.Main\_Status](#e6c44ed0-f809-4c6f-87df-f77b802e178e)
    *   [3.15 fk Sub\_Status(1).Id to Project.Sub\_Status](#e9b43148-9168-4c4d-afa2-d150af82b369)
    *   [3.16 fk Sub\_Status\_Project.Main\_Status\_Id to Main\_Status\_Project.Id](#cf499803-5576-48a6-acfd-297d9ac4a0d6)
    *   [3.17 fk Main\_Status\_Project(1).Id to WorkAssignment.Main\_Status](#5fa333a8-8b77-4b4b-b28f-abd7435e1ec6)
    *   [3.18 fk Sub\_Status\_Project(1).Id to WorkAssignment.Sub\_Status](#87f52dd0-3aa4-45ed-9abc-93e093b5cec6)
    *   [3.19 fk Sub\_Status\_Project(1).Main\_Status\_Id to Main\_Status\_Project(1).Id](#f0a6c69c-7805-407a-873a-7254ffe89fde)
    *   [3.20 fk StaffStatus.Staff\_Id to Staff.Id](#4fb17ddc-f925-4f11-96cb-0faec57bb0d8)
    *   [3.21 fk StaffStatus.Status\_Id to Status\_Staff.Id](#e0cc55e4-a3e8-42e2-941b-5bc2b5cc5183)
    *   [3.22 fk StaffingOrderStaffResource.Staffing\_Order\_Id to StaffingOrder.Id](#cb69c639-3bd9-499d-9c3f-7444b2e41497)
    *   [3.23 fk StaffingOrderStaffResource.Staff\_Id to Staff.Id](#7cbf0d28-68ab-45b7-81b0-a47b614bc005)
    *   [3.24 fk StaffingOrderStaffResource.Role\_Id to Role.Id](#04b74808-1488-49ad-a0d9-cba4873b6b92)
    *   [3.25 fk SOSRMonthlyAllocation.Staffing\_Order\_Id to StaffingOrderStaffResource.Staffing\_Order\_Id](#c5899a2d-b315-4251-920c-b1541157e358)
    *   [3.26 fk SOSRMonthlyAllocation.Staff\_Id to StaffingOrderStaffResource.Staff\_Id](#d0104edb-36b7-4c24-af38-1d6e73585c4a)
    *   [3.27 fk WorkAssignmentMonthlyAllocation.Work\_Assignment\_Id to WorkAssignment.Id](#bd9b0c49-e002-4ae4-be05-9b0de7ac64f7)

### <a id="model"></a>

##### 1\. Model

##### 1.1 Model **New model**

##### 1.1.1 **New model** Entity Relationship Diagram

![Hackolade image](AutoAssignAgent_DataModel/image2.png?raw=true)

##### 1.1.2 **New model** Graph Diagram

![Hackolade image](AutoAssignAgent_DataModel/image3.png?raw=true)

##### 1.1.3 **New model** Properties

##### 1.1.3.1 **Details** tab

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td><span>Model name</span></td><td>New model</td></tr><tr><td><span>Target</span></td><td>Polyglot</td></tr><tr><td><span>Lineage capture</span></td><td></td></tr></tbody></table>

##### 1.1.3.2 **Options** tab

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

##### 1.1.4 **New model** User-Defined Types

### <a id="5be6c733-b357-4f55-be6d-03e9bcad7997"></a>1.1.4.1 Attribute **Period**

##### 1.1.4.1.1 **Period** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image4.png?raw=true)

##### 1.1.4.1.2 **Period** Hierarchy

Parent Attribute: **Definitions**

Child attribute(s):

<table class="field-properties-table"><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#50f180f3-fb21-43de-bd99-ec0f13564535 class="margin-NaN">[0]&nbsp;start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#f22941fe-ca29-401b-af14-ec9c7d81924e class="margin-NaN">[1]&nbsp;end</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

##### 1.1.4.1.3 **Period** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period</td></tr><tr><td>Type</td><td>tuple</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>期間タプル。開始日・終了日のペアで年月レンジを表す（Polyglot 定義）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="50f180f3-fb21-43de-bd99-ec0f13564535"></a>1.1.4.2 Attribute **\[0\] start**

##### 1.1.4.2.1 **\[0\] start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="f22941fe-ca29-401b-af14-ec9c7d81924e"></a>1.1.4.3 Attribute **\[1\] end**

##### 1.1.4.3.1 **\[1\] end** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>end</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr></tbody></table>

### <a id="12034391-de6a-4a5f-bb0e-a6a4d4cd64e1"></a>1.1.4.4 Attribute **Staff**

##### 1.1.4.4.1 **Staff** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image5.png?raw=true)

##### 1.1.4.4.2 **Staff** Hierarchy

Parent Attribute: **Definitions**

Child attribute(s):

<table class="field-properties-table"><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#2340c430-c063-4904-ba8d-c2dadbe7f83d class="margin-NaN">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#bc681389-d13c-4c27-a793-2b59ab204dec class="margin-NaN">Role_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#24762497-4fd4-4020-a4f6-1567e4cd2ef4 class="margin-NaN">Amount</a></td><td class="no-break-word">integer</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

##### 1.1.4.4.3 **Staff** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff</td></tr><tr><td>Type</td><td>object</td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

### <a id="2340c430-c063-4904-ba8d-c2dadbe7f83d"></a>1.1.4.5 Attribute **Staff\_Id**

##### 1.1.4.5.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="bc681389-d13c-4c27-a793-2b59ab204dec"></a>1.1.4.6 Attribute **Role\_Id**

##### 1.1.4.6.1 **Role\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Role_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="24762497-4fd4-4020-a4f6-1567e4cd2ef4"></a>1.1.4.7 Attribute **Amount**

##### 1.1.4.7.1 **Amount** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Amount</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

### <a id="f75968e4-0f1c-4e1f-a2e3-dec489e18312"></a>1.1.4.8 Attribute **Monthly\_Allocation**

##### 1.1.4.8.1 **Monthly\_Allocation** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image6.png?raw=true)

##### 1.1.4.8.2 **Monthly\_Allocation** Hierarchy

Parent Attribute: **Definitions**

Child attribute(s):

<table class="field-properties-table"><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#98d298db-e7c0-4ecb-85aa-f6ecb4e2b318 class="margin-NaN">[0]&nbsp;year-month</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#08411e5d-08a0-40a8-a452-6fd996958603 class="margin-NaN">[1]&nbsp;effort</a></td><td class="no-break-word">float</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

##### 1.1.4.8.3 **Monthly\_Allocation** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Monthly_Allocation</td></tr><tr><td>Type</td><td>tuple</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>月別工数タプル。年月と effort のペア配列（Polyglot 定義）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="98d298db-e7c0-4ecb-85aa-f6ecb4e2b318"></a>1.1.4.9 Attribute **\[0\] year-month**

##### 1.1.4.9.1 **\[0\] year-month** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>year-month</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="08411e5d-08a0-40a8-a452-6fd996958603"></a>1.1.4.10 Attribute **\[1\] effort**

##### 1.1.4.10.1 **\[1\] effort** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>effort</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>float</td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

### <a id="19540d19-656b-4903-b000-367731cf651d"></a>1.1.4.11 Attribute **Customer**

##### 1.1.4.11.1 **Customer** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image7.png?raw=true)

##### 1.1.4.11.2 **Customer** Hierarchy

Parent Attribute: **Definitions**

Child attribute(s):

<table class="field-properties-table"><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#68de3adc-2927-4a05-9368-4ee9d7a5db2d class="margin-NaN">Name</a></td><td class="no-break-word">nvarchar</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

##### 1.1.4.11.3 **Customer** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Customer</td></tr><tr><td>Type</td><td>object</td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

### <a id="68de3adc-2927-4a05-9368-4ee9d7a5db2d"></a>1.1.4.12 Attribute **Name**

##### 1.1.4.12.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="containers"></a>

##### 2\. Containers

### <a id="16e6b351-03a2-4495-a5cb-318758a14203"></a>2.1 Container **要員（スタッフ）**

##### 2.1.1 **要員（スタッフ）** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Container name</td><td>要員（スタッフ）</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><h1>社内アサイン予約アプリのメインデータモデル</h1></div></td></tr></tbody></table>

### <a id="16e6b351-03a2-4495-a5cb-318758a14203-children"></a>2.1.2 **要員（スタッフ）** Entities

### <a id="7722533f-7242-4c5a-9535-44e7c539fb6f"></a>2.1.2.1 Entity **Employee**

##### 2.1.2.1.1 **Employee** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image8.png?raw=true)

##### 2.1.2.1.2 **Employee** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Employee</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Acter（Ac）。社員。共通 Staff にぶら下がり、案件の営業担当や予約の文脈で参照される。起用可否の大分類・詳細は StaffStatus と Status_Staff で履歴管理し、稼働の余地は予約・稼働割当から算出する（docs/employee-status.md、docs/data-model-flowchart.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.1.2.1.3 **Employee** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#df0adbb7-d544-413b-aded-7b7cc055d0f6 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。社員レコードの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#d0f62abe-3b22-42ff-8e1c-7ff147bc195b class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>スタッフID。Employee と Staff を1対1で結ぶ。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a65c8e44-9af4-49e6-8b93-3e669fd5c4c6 class="margin-0">Name</a></td><td class="no-break-word">varchar</td><td>false</td><td></td><td><div class="docs-markdown"><p>氏名。社員の表示用名称。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#e48edbfc-464f-4dde-b596-7d73cdc30ff8 class="margin-0">Number</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>社員番号。検索用インデックスを付与しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#bdd94487-4b23-40ca-8371-64cead5fea98 class="margin-0">Grade</a></td><td class="no-break-word">varchar</td><td>false</td><td></td><td><div class="docs-markdown"><p>等級。人事区分のラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a089a46e-8ba1-44c4-bbdb-4cfad826a0a1 class="margin-0">Role_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>ロールID。社員がシステム上担う役割（例: 営業）のマスタ参照。Staff のロールと揃える想定。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="df0adbb7-d544-413b-aded-7b7cc055d0f6"></a>2.1.2.1.3.1 Attribute **Id**

##### 2.1.2.1.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。社員レコードの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="d0f62abe-3b22-42ff-8e1c-7ff147bc195b"></a>2.1.2.1.3.2 Attribute **Staff\_Id**

##### 2.1.2.1.3.2.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。Employee と Staff を1対1で結ぶ。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Foreign field</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a65c8e44-9af4-49e6-8b93-3e669fd5c4c6"></a>2.1.2.1.3.3 Attribute **Name**

##### 2.1.2.1.3.3.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>varchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>氏名。社員の表示用名称。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="e48edbfc-464f-4dde-b596-7d73cdc30ff8"></a>2.1.2.1.3.4 Attribute **Number**

##### 2.1.2.1.3.4.1 **Number** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Number</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>社員番号。検索用インデックスを付与しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

### <a id="bdd94487-4b23-40ca-8371-64cead5fea98"></a>2.1.2.1.3.5 Attribute **Grade**

##### 2.1.2.1.3.5.1 **Grade** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Grade</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>varchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>等級。人事区分のラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a089a46e-8ba1-44c4-bbdb-4cfad826a0a1"></a>2.1.2.1.3.6 Attribute **Role\_Id**

##### 2.1.2.1.3.6.1 **Role\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Role_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ロールID。社員がシステム上担う役割（例: 営業）のマスタ参照。Staff のロールと揃える想定。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Foreign field</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

##### 2.1.2.1.4 **Employee** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="7722533f-7242-4c5a-9535-44e7c539fb6f-children"></a>2.1.2.1.5 Employee **Child entities:**

### <a id="2ffada2e-93f5-4524-a1b8-5164c9f84f7e"></a>2.1.2.2 Entity **Role**

##### 2.1.2.2.1 **Role** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image9.png?raw=true)

##### 2.1.2.2.2 **Role** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Role</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Role。営業・PS技術者などアプリ上の役割マスタ。Staff・Employee・Business_Partner・予約明細から参照され、data-model-flowchart の橙系ノードに相当。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>true</td></tr></tbody></table>

##### 2.1.2.2.3 **Role** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。ロールマスタの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#47c1727d-b77a-4827-b30a-4f194f156821 class="margin-0">anyOf</a></td><td class="no-break-word">choice</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#fa64ec6a-9460-473e-8a6c-f10d4599cba8 class="margin-5">[0]&nbsp;Sales</a></td><td class="no-break-word">subschema</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#fb4aa03f-5dd3-490a-9fb7-961bfbbc4077 class="margin-5">[1]&nbsp;PS_Engineer</a></td><td class="no-break-word">subschema</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#0db60759-10d6-4afc-8f85-e81adb0a872f class="margin-5">[2]&nbsp;PS_BusinessAchitect</a></td><td class="no-break-word">subschema</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#e84f01a5-a891-4628-9776-089caaf14445 class="margin-5">[3]&nbsp;PS_PojectManager</a></td><td class="no-break-word">subschema</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901061 class="margin-0">Name</a></td><td class="no-break-word">nvarchar</td><td>true</td><td></td><td><div class="docs-markdown"><p>ロール名。画面表示用の役割ラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="02d54cc6-6dda-47b6-bc9d-69a66873770d"></a>2.1.2.2.3.1 Attribute **Id**

##### 2.1.2.2.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。ロールマスタの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="47c1727d-b77a-4827-b30a-4f194f156821"></a>2.1.2.2.3.2 Attribute **anyOf**

##### 2.1.2.2.3.2.1 **anyOf** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image10.png?raw=true)

##### 2.1.2.2.3.2.2 **anyOf** Hierarchy

Parent Attribute: **Role**

Child attribute(s):

<table class="field-properties-table"><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#fa64ec6a-9460-473e-8a6c-f10d4599cba8 class="margin-NaN">[0]&nbsp;Sales</a></td><td class="no-break-word">object</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#fb4aa03f-5dd3-490a-9fb7-961bfbbc4077 class="margin-NaN">[1]&nbsp;PS_Engineer</a></td><td class="no-break-word">object</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#0db60759-10d6-4afc-8f85-e81adb0a872f class="margin-NaN">[2]&nbsp;PS_BusinessAchitect</a></td><td class="no-break-word">object</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#e84f01a5-a891-4628-9776-089caaf14445 class="margin-NaN">[3]&nbsp;PS_PojectManager</a></td><td class="no-break-word">object</td><td>false</td><td></td><td><div class="docs-markdown"></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

##### 2.1.2.2.3.2.3 **anyOf** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Choice</td><td>anyOf</td></tr><tr><td>Activated</td><td>true</td></tr></tbody></table>

### <a id="fa64ec6a-9460-473e-8a6c-f10d4599cba8"></a>2.1.2.2.3.3 Attribute **\[0\] Sales**

##### 2.1.2.2.3.3.1 **\[0\] Sales** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>Sales</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>object</td></tr><tr><td>Additional properties</td><td>true</td></tr></tbody></table>

### <a id="fb4aa03f-5dd3-490a-9fb7-961bfbbc4077"></a>2.1.2.2.3.4 Attribute **\[1\] PS\_Engineer**

##### 2.1.2.2.3.4.1 **\[1\] PS\_Engineer** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>PS_Engineer</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>object</td></tr><tr><td>Additional properties</td><td>true</td></tr></tbody></table>

### <a id="0db60759-10d6-4afc-8f85-e81adb0a872f"></a>2.1.2.2.3.5 Attribute **\[2\] PS\_BusinessAchitect**

##### 2.1.2.2.3.5.1 **\[2\] PS\_BusinessAchitect** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>PS_BusinessAchitect</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>object</td></tr></tbody></table>

### <a id="e84f01a5-a891-4628-9776-089caaf14445"></a>2.1.2.2.3.6 Attribute **\[3\] PS\_PojectManager**

##### 2.1.2.2.3.6.1 **\[3\] PS\_PojectManager** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Display name</td><td>PS_PojectManager</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>object</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901061"></a>2.1.2.2.3.7 Attribute **Name**

##### 2.1.2.2.3.7.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ロール名。画面表示用の役割ラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

##### 2.1.2.2.4 **Role** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="2ffada2e-93f5-4524-a1b8-5164c9f84f7e-children"></a>2.1.2.2.5 Role **Child entities:**

### <a id="8e985525-5bf1-4633-945a-35054a47d5e1"></a>2.1.2.3 Entity **Staff**

##### 2.1.2.3.1 **Staff** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image11.png?raw=true)

##### 2.1.2.3.2 **Staff** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Staff</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>社員と BP の共通スタッフ行。Employee / Business_Partner が Staff_Id で参照し、予約明細・稼働割当の「誰」は本 Id を指す（docs/data-model-flowchart.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.1.2.3.3 **Staff** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk, fk</td><td><div class="docs-markdown"><p>識別子。スタッフの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#ff128eb6-ba31-4ce9-aaf2-73a793fb8285 class="margin-0">Display_Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。一覧・選択肢で用いるラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#8f341593-620c-4cea-a2c3-284a403eea72 class="margin-0">Role_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>ロールID。このスタッフが担う役割（PS技術者など）のマスタ参照。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#502d8f09-1dae-49cd-88c5-a72ef618e2dc class="margin-0">Staff_Category</a></td><td class="no-break-word">enum</td><td>true</td><td></td><td><div class="docs-markdown"><p>スタッフ区分。Employee（社員）または Business_Partner（BP）のいずれか。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="692ca41a-893a-4498-aaec-7001ad6e7e81"></a>2.1.2.3.3.1 Attribute **Id**

##### 2.1.2.3.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。スタッフの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="ff128eb6-ba31-4ce9-aaf2-73a793fb8285"></a>2.1.2.3.3.2 Attribute **Display\_Name**

##### 2.1.2.3.3.2.1 **Display\_Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Display_Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。一覧・選択肢で用いるラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="8f341593-620c-4cea-a2c3-284a403eea72"></a>2.1.2.3.3.3 Attribute **Role\_Id**

##### 2.1.2.3.3.3.1 **Role\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Role_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ロールID。このスタッフが担う役割（PS技術者など）のマスタ参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Foreign field</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="502d8f09-1dae-49cd-88c5-a72ef618e2dc"></a>2.1.2.3.3.4 Attribute **Staff\_Category**

##### 2.1.2.3.3.4.1 **Staff\_Category** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Category</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>enum</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフ区分。Employee（社員）または Business_Partner（BP）のいずれか。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

##### 2.1.2.3.4 **Staff** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="2be3c97d-483a-474f-b219-cfbabfe4e88f"></a>2.1.2.4 Entity **Business\_Partner**

##### 2.1.2.4.1 **Business\_Partner** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image12.png?raw=true)

##### 2.1.2.4.2 **Business\_Partner** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Business_Partner</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Acter（Ac）。BP（ビジネスパートナー）。Staff を介して PS ロール等とプロジェクト・稼働に接続し、契約待ちの予約フローとも関係しうる（docs/data-model-flowchart.md、reservation-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.1.2.4.3 **Business\_Partner** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#b4266208-673c-46ef-81ee-076e6f7a9121 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk</td><td><div class="docs-markdown"><p>識別子。BP レコードの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#fbf73a6f-8e0e-401e-a9da-0a10e934c83a class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>スタッフID。BP と Staff を1対1で結ぶ。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#40ce81c3-61d7-416a-8b57-4432a36d36a1 class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>名称。BP の表示名。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#c12810f0-11ca-4ac5-ad66-8c019af71dd0 class="margin-0">Number</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>取引先番号。検索用インデックスを付与しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#ab758ee7-9e41-4214-9dbe-c6db17e06df3 class="margin-0">Role_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>ロールID。BP が担う役割のマスタ参照。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="b4266208-673c-46ef-81ee-076e6f7a9121"></a>2.1.2.4.3.1 Attribute **Id**

##### 2.1.2.4.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。BP レコードの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="fbf73a6f-8e0e-401e-a9da-0a10e934c83a"></a>2.1.2.4.3.2 Attribute **Staff\_Id**

##### 2.1.2.4.3.2.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。BP と Staff を1対1で結ぶ。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Foreign field</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="40ce81c3-61d7-416a-8b57-4432a36d36a1"></a>2.1.2.4.3.3 Attribute **Name**

##### 2.1.2.4.3.3.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>名称。BP の表示名。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="c12810f0-11ca-4ac5-ad66-8c019af71dd0"></a>2.1.2.4.3.4 Attribute **Number**

##### 2.1.2.4.3.4.1 **Number** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Number</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>取引先番号。検索用インデックスを付与しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

### <a id="ab758ee7-9e41-4214-9dbe-c6db17e06df3"></a>2.1.2.4.3.5 Attribute **Role\_Id**

##### 2.1.2.4.3.5.1 **Role\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Role_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ロールID。BP が担う役割のマスタ参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Foreign field</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

##### 2.1.2.4.4 **Business\_Partner** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="ca58d02a-a7f1-4aa8-b8a3-617b1324047f"></a>2.1.2.5 Entity **Status\_Staff**

##### 2.1.2.5.1 **Status\_Staff** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image13.png?raw=true)

##### 2.1.2.5.2 **Status\_Staff** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Status_Staff</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフ状態マスタ。社員の起用可否の詳細区分（起用前・在職中・休職中・退職済 等）を定義し、StaffStatus から参照する（docs/employee-status.md）。大分類 Active/Inactive はマスタ設計または別列で表現。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.1.2.5.3 **Status\_Staff** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#213a2810-204b-4a64-a0e0-bdacfada5618 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。状態マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#9faf22da-441d-4d36-8bdb-5a651d50b39b class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。起用可否詳細のラベル（例: 在職中）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#38d023b8-b4ee-4700-b049-45579e4e1c95 class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="213a2810-204b-4a64-a0e0-bdacfada5618"></a>2.1.2.5.3.1 Attribute **Id**

##### 2.1.2.5.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。状態マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="9faf22da-441d-4d36-8bdb-5a651d50b39b"></a>2.1.2.5.3.2 Attribute **Name**

##### 2.1.2.5.3.2.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。起用可否詳細のラベル（例: 在職中）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="38d023b8-b4ee-4700-b049-45579e4e1c95"></a>2.1.2.5.3.3 Attribute **Sort\_Order**

##### 2.1.2.5.3.3.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.1.2.5.4 **Status\_Staff** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0"></a>2.1.2.6 Entity **StaffStatus**

##### 2.1.2.6.1 **StaffStatus** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image14.png?raw=true)

##### 2.1.2.6.2 **StaffStatus** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>StaffStatus</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフごとの状態履歴。いつからいつまでどの Status_Staff だったかを保持し、人事イベントで区間が切り替わる想定（docs/employee-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#16e6b351-03a2-4495-a5cb-318758a14203><span class="name-container">要員（スタッフ）</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.1.2.6.3 **StaffStatus** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#911d62dc-feb9-47a6-a81c-e4e9469c1028 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk</td><td><div class="docs-markdown"><p>識別子。状態履歴行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#55777e85-5f0d-40aa-950e-3f999361ce64 class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>スタッフID。履歴の対象となる Staff。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#2c91d609-6ee4-4892-91cd-be9d04279863 class="margin-0">Status_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>状態マスタID。Status_Staff の詳細区分（起用前・在職中 等）への参照。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901101 class="margin-0">Status_Period_Start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>状態期間開始日。人事上の状態が始まる日（業務定義に従う）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901102 class="margin-0">Status_Period_End</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>状態期間終了日。人事上の状態が終わる日（未設定は現在有効など運用で解釈）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901103 class="margin-0">Status_Valid_Period_Start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>状態の有効開始日。システム上この履歴をいつから適用するか。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901104 class="margin-0">Status_Valid_Period_End</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>状態の有効終了日。システム上この履歴の適用をいつまでとするか。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="911d62dc-feb9-47a6-a81c-e4e9469c1028"></a>2.1.2.6.3.1 Attribute **Id**

##### 2.1.2.6.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。状態履歴行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="55777e85-5f0d-40aa-950e-3f999361ce64"></a>2.1.2.6.3.2 Attribute **Staff\_Id**

##### 2.1.2.6.3.2.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。履歴の対象となる Staff。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Foreign field</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="2c91d609-6ee4-4892-91cd-be9d04279863"></a>2.1.2.6.3.3 Attribute **Status\_Id**

##### 2.1.2.6.3.3.1 **Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>状態マスタID。Status_Staff の詳細区分（起用前・在職中 等）への参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#ca58d02a-a7f1-4aa8-b8a3-617b1324047f>Status_Staff</a></td></tr><tr><td>Foreign field</td><td><a href=#213a2810-204b-4a64-a0e0-bdacfada5618>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901101"></a>2.1.2.6.3.4 Attribute **Status\_Period\_Start**

##### 2.1.2.6.3.4.1 **Status\_Period\_Start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status_Period_Start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>状態期間開始日。人事上の状態が始まる日（業務定義に従う）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901102"></a>2.1.2.6.3.5 Attribute **Status\_Period\_End**

##### 2.1.2.6.3.5.1 **Status\_Period\_End** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status_Period_End</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>状態期間終了日。人事上の状態が終わる日（未設定は現在有効など運用で解釈）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901103"></a>2.1.2.6.3.6 Attribute **Status\_Valid\_Period\_Start**

##### 2.1.2.6.3.6.1 **Status\_Valid\_Period\_Start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status_Valid_Period_Start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>状態の有効開始日。システム上この履歴をいつから適用するか。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901104"></a>2.1.2.6.3.7 Attribute **Status\_Valid\_Period\_End**

##### 2.1.2.6.3.7.1 **Status\_Valid\_Period\_End** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status_Valid_Period_End</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>状態の有効終了日。システム上この履歴の適用をいつまでとするか。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

##### 2.1.2.6.4 **StaffStatus** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="11479816-59ea-4786-960c-f43dc4bb45a4"></a>2.2 Container **予約**

##### 2.2.1 **予約** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Container name</td><td>予約</td></tr><tr><td>Activated</td><td>true</td></tr></tbody></table>

### <a id="11479816-59ea-4786-960c-f43dc4bb45a4-children"></a>2.2.2 **予約** Entities

### <a id="465ab053-9432-4c43-82ae-b0457f3c35cc"></a>2.2.2.1 Entity **StaffingOrder**

##### 2.2.2.1.1 **StaffingOrder** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image15.png?raw=true)

##### 2.2.2.1.2 **StaffingOrder** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>StaffingOrder</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Polyglot only</td><td>false</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Transaction（Tr）。予約。プロジェクトに紐づき、要員・期間など同種の内包情報を StaffingOrderStaffResource で複数行保持する。大分類・確定待ちかつ小分類・予約完了に至ったタイミングで稼働割当（WorkAssignment）を生成するトリガとなる（docs/reservation-status.md、docs/data-model-flowchart.md）。申請時点から大分類は確定待ち（ドラフトは小分類・作成中）。</p></div></td></tr><tr><td>Container</td><td><a href=#11479816-59ea-4786-960c-f43dc4bb45a4><span class="name-container">予約</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.2.2.1.3 **StaffingOrder** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。予約レコードの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#4de736bf-1223-4782-9e49-3e6fbd6f92a5 class="margin-0">Project_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk</td><td><div class="docs-markdown"><p>プロジェクトID。予約が紐づく案件への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#3d7a4ea8-c32c-4cd6-bb1c-e4d30aa42b58 class="margin-0">Description</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>予約説明・備考。申請内容の補足や社内メモ。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#63ccf12f-a83a-4358-8926-7b52c511094a class="margin-0">Attachments</a></td><td class="no-break-word">binary</td><td>false</td><td></td><td><div class="docs-markdown"><p>添付ファイル。承認資料などバイナリを格納しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#07bb8a43-04af-4198-b4f1-7d927ac0ec97 class="margin-0">Total_Amount</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>合計金額（予約）。インデックス対象。整数で保持（通貨単位は運用で定義）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#719b6b39-9b73-4bc8-9526-daa6c8a939ea class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス大分類ID。確定待ち・確定済み・不成立済みのいずれか（docs/reservation-status.md）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#795e843e-eebc-4053-a4d0-5f10f726330d class="margin-0">Sub_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（作成中・承認待ち・予約完了・解放・却下 等）を表すマスタ参照。予約完了は稼働割当生成のトリガ。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901081 class="margin-0">Period_Start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>予約期間開始日。申請時点で把握する「いつから」の起点。インデックス対象。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901082 class="margin-0">Period_End</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>予約期間終了日。申請時点で把握する「いつまで」の終端。インデックス対象。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="97fabd89-bdc3-419a-8094-fb4f5a7d9c21"></a>2.2.2.1.3.1 Attribute **Id**

##### 2.2.2.1.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。予約レコードの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="4de736bf-1223-4782-9e49-3e6fbd6f92a5"></a>2.2.2.1.3.2 Attribute **Project\_Id**

##### 2.2.2.1.3.2.1 **Project\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Project_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>プロジェクトID。予約が紐づく案件への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Foreign field</td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="3d7a4ea8-c32c-4cd6-bb1c-e4d30aa42b58"></a>2.2.2.1.3.3 Attribute **Description**

##### 2.2.2.1.3.3.1 **Description** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Description</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約説明・備考。申請内容の補足や社内メモ。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="63ccf12f-a83a-4358-8926-7b52c511094a"></a>2.2.2.1.3.4 Attribute **Attachments**

##### 2.2.2.1.3.4.1 **Attachments** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Attachments</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>binary</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>添付ファイル。承認資料などバイナリを格納しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="07bb8a43-04af-4198-b4f1-7d927ac0ec97"></a>2.2.2.1.3.5 Attribute **Total\_Amount**

##### 2.2.2.1.3.5.1 **Total\_Amount** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Total_Amount</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>合計金額（予約）。インデックス対象。整数で保持（通貨単位は運用で定義）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

### <a id="719b6b39-9b73-4bc8-9526-daa6c8a939ea"></a>2.2.2.1.3.6 Attribute **Main\_Status\_Id**

##### 2.2.2.1.3.6.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス大分類ID。確定待ち・確定済み・不成立済みのいずれか（docs/reservation-status.md）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="795e843e-eebc-4053-a4d0-5f10f726330d"></a>2.2.2.1.3.7 Attribute **Sub\_Status\_Id**

##### 2.2.2.1.3.7.1 **Sub\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sub_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（作成中・承認待ち・予約完了・解放・却下 等）を表すマスタ参照。予約完了は稼働割当生成のトリガ。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901081"></a>2.2.2.1.3.8 Attribute **Period\_Start**

##### 2.2.2.1.3.8.1 **Period\_Start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_Start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約期間開始日。申請時点で把握する「いつから」の起点。インデックス対象。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901082"></a>2.2.2.1.3.9 Attribute **Period\_End**

##### 2.2.2.1.3.9.1 **Period\_End** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_End</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約期間終了日。申請時点で把握する「いつまで」の終端。インデックス対象。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

##### 2.2.2.1.4 **StaffingOrder** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

##### 2.2.2.1.5 **StaffingOrder** Definitions

### <a id="99713080-b02a-4feb-af8f-3554cc4f06f1"></a>2.2.2.1.5.1 Attribute **Status**

##### 2.2.2.1.5.1.1 **Status** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Status</td></tr><tr><td>Type</td><td>varchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス（定義用プレースホルダ）。実体は Main_Status / Sub_Status のマスタ参照で表す。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="465ab053-9432-4c43-82ae-b0457f3c35cc-children"></a>2.2.2.1.6 StaffingOrder **Child entities:**

### <a id="a1b2c3d4-e5f6-4789-a012-345678901001"></a>2.2.2.2 Entity **StaffingOrderStaffResource**

##### 2.2.2.2.1 **StaffingOrderStaffResource** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image16.png?raw=true)

##### 2.2.2.2.2 **StaffingOrderStaffResource** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>StaffingOrderStaffResource</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約（StaffingOrder）に内包する要員リソース明細。誰（Staff）をどのロールでどの工数（Amount）で押さえるかを複数行で保持し、予約完了時に稼働割当生成の元になる（docs/reservation-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#11479816-59ea-4786-960c-f43dc4bb45a4><span class="name-container">予約</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.2.2.2.3 **StaffingOrderStaffResource** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011 class="margin-0">Staffing_Order_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk, dk</td><td><div class="docs-markdown"><p>予約ID。親 StaffingOrder への外部キー（複合主キーの一部）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012 class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk, dk</td><td><div class="docs-markdown"><p>スタッフID。予約対象の要員（複合主キーの一部）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901013 class="margin-0">Role_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk</td><td><div class="docs-markdown"><p>ロールID。PS技術者など、その枠での役割（Role マスタ）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901014 class="margin-0">Amount</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>工数・数量。当該スタッフ行の押さえ量（整数、単位は運用で定義）。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901011"></a>2.2.2.2.3.1 Attribute **Staffing\_Order\_Id**

##### 2.2.2.2.3.1.1 **Staffing\_Order\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staffing_Order_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約ID。親 StaffingOrder への外部キー（複合主キーの一部）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Foreign field</td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901012"></a>2.2.2.2.3.2 Attribute **Staff\_Id**

##### 2.2.2.2.3.2.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。予約対象の要員（複合主キーの一部）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Foreign field</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901013"></a>2.2.2.2.3.3 Attribute **Role\_Id**

##### 2.2.2.2.3.3.1 **Role\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Role_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ロールID。PS技術者など、その枠での役割（Role マスタ）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Foreign field</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901014"></a>2.2.2.2.3.4 Attribute **Amount**

##### 2.2.2.2.3.4.1 **Amount** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Amount</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>工数・数量。当該スタッフ行の押さえ量（整数、単位は運用で定義）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.2.2.2.4 **StaffingOrderStaffResource** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901021"></a>2.2.2.3 Entity **StaffingOrderStaffResourceMonthlyAllocation**

##### 2.2.2.3.1 **StaffingOrderStaffResourceMonthlyAllocation** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image17.png?raw=true)

##### 2.2.2.3.2 **StaffingOrderStaffResourceMonthlyAllocation** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>StaffingOrderStaffResourceMonthlyAllocation</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約リソース行の月別工数分解。StaffingOrderStaffResource と同じキーで親子となり、年月ごとの effort を保持する。</p></div></td></tr><tr><td>Container</td><td><a href=#11479816-59ea-4786-960c-f43dc4bb45a4><span class="name-container">予約</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.2.2.3.3 **StaffingOrderStaffResourceMonthlyAllocation** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901031 class="margin-0">Staffing_Order_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk</td><td><div class="docs-markdown"><p>予約ID。親リソース行と同一の StaffingOrder（複合主キーの一部）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901032 class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk</td><td><div class="docs-markdown"><p>スタッフID。親リソース行と同一の Staff（複合主キーの一部）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901033 class="margin-0">Year_Month</a></td><td class="no-break-word">date</td><td>true</td><td></td><td><div class="docs-markdown"><p>対象年月。日付型で月を表す。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901034 class="margin-0">Effort</a></td><td class="no-break-word">float</td><td>true</td><td></td><td><div class="docs-markdown"><p>工数。当該年月の配分（実数）。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901031"></a>2.2.2.3.3.1 Attribute **Staffing\_Order\_Id**

##### 2.2.2.3.3.1.1 **Staffing\_Order\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staffing_Order_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約ID。親リソース行と同一の StaffingOrder（複合主キーの一部）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Foreign field</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011>Staffing_Order_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901032"></a>2.2.2.3.3.2 Attribute **Staff\_Id**

##### 2.2.2.3.3.2.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。親リソース行と同一の Staff（複合主キーの一部）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Foreign field</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012>Staff_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901033"></a>2.2.2.3.3.3 Attribute **Year\_Month**

##### 2.2.2.3.3.3.1 **Year\_Month** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Year_Month</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>対象年月。日付型で月を表す。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901034"></a>2.2.2.3.3.4 Attribute **Effort**

##### 2.2.2.3.3.4.1 **Effort** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Effort</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>float</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>工数。当該年月の配分（実数）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.2.2.3.4 **StaffingOrderStaffResourceMonthlyAllocation** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="d3cc3aa9-6ec9-4409-b35b-01cae6352f56"></a>2.2.2.4 Entity **Main\_Status\_StaffingOrder**

##### 2.2.2.4.1 **Main\_Status\_StaffingOrder** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image18.png?raw=true)

##### 2.2.2.4.2 **Main\_Status\_StaffingOrder** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Main_Status_StaffingOrder</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約（StaffingOrder）のステータス大分類マスタ。確定待ち・確定済み・不成立済みなど一覧の粗い帯（docs/reservation-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#11479816-59ea-4786-960c-f43dc4bb45a4><span class="name-container">予約</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.2.2.4.3 **Main\_Status\_StaffingOrder** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk, fk</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#730520b7-6ca1-461d-ae03-43d49d6939f5 class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。大分類のラベル（例: 確定待ち）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#80faecdb-b2c0-4cab-937d-abe9fb9c4d21 class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。一覧やドロップダウンでの並びに使用。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="8686734e-d824-4979-b5e9-d5b9d8fd5d98"></a>2.2.2.4.3.1 Attribute **Id**

##### 2.2.2.4.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Foreign field</td><td><a href=#719b6b39-9b73-4bc8-9526-daa6c8a939ea>Main_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="730520b7-6ca1-461d-ae03-43d49d6939f5"></a>2.2.2.4.3.2 Attribute **Name**

##### 2.2.2.4.3.2.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。大分類のラベル（例: 確定待ち）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="80faecdb-b2c0-4cab-937d-abe9fb9c4d21"></a>2.2.2.4.3.3 Attribute **Sort\_Order**

##### 2.2.2.4.3.3.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。一覧やドロップダウンでの並びに使用。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.2.2.4.4 **Main\_Status\_StaffingOrder** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="83f1137b-4e38-4a42-b17d-89d969485107"></a>2.2.2.5 Entity **Sub\_Status\_StaffingOrder**

##### 2.2.2.5.1 **Sub\_Status\_StaffingOrder** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image19.png?raw=true)

##### 2.2.2.5.2 **Sub\_Status\_StaffingOrder** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Sub_Status_StaffingOrder</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>予約のステータス小分類マスタ。各大分類に属する詳細（作成中・承認待ち・予約完了・解放・却下 等、docs/reservation-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#11479816-59ea-4786-960c-f43dc4bb45a4><span class="name-container">予約</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.2.2.5.3 **Sub\_Status\_StaffingOrder** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#64b68477-5191-422f-979c-caebff634dc4 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, fk</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#5ce306f3-3cbe-4d07-ba7e-442c7dcda5ce class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_StaffingOrder への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#0d601bb9-b4e0-40de-8a05-f837df5dc414 class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。小分類のラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#8fb0aa82-b9be-4657-a32b-dd92573be6ae class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="64b68477-5191-422f-979c-caebff634dc4"></a>2.2.2.5.3.1 Attribute **Id**

##### 2.2.2.5.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Foreign field</td><td><a href=#795e843e-eebc-4053-a4d0-5f10f726330d>Sub_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="5ce306f3-3cbe-4d07-ba7e-442c7dcda5ce"></a>2.2.2.5.3.2 Attribute **Main\_Status\_Id**

##### 2.2.2.5.3.2.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_StaffingOrder への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#d3cc3aa9-6ec9-4409-b35b-01cae6352f56>Main_Status_StaffingOrder</a></td></tr><tr><td>Foreign field</td><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="0d601bb9-b4e0-40de-8a05-f837df5dc414"></a>2.2.2.5.3.3 Attribute **Name**

##### 2.2.2.5.3.3.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。小分類のラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="8fb0aa82-b9be-4657-a32b-dd92573be6ae"></a>2.2.2.5.3.4 Attribute **Sort\_Order**

##### 2.2.2.5.3.4.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.2.2.5.4 **Sub\_Status\_StaffingOrder** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="31bd3274-d6cc-4b12-b16a-bebd0547d2a7"></a>2.3 Container **プロジェクト**

##### 2.3.1 **プロジェクト** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Container name</td><td>プロジェクト</td></tr><tr><td>Activated</td><td>true</td></tr></tbody></table>

### <a id="31bd3274-d6cc-4b12-b16a-bebd0547d2a7-children"></a>2.3.2 **プロジェクト** Entities

### <a id="b351e292-4128-4bb7-91c6-4b0c069dec74"></a>2.3.2.1 Entity **Project**

##### 2.3.2.1.1 **Project** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image20.png?raw=true)

##### 2.3.2.1.2 **Project** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Project</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Transaction（Tr）。案件（プロジェクト）。大分類は受注・要因確定待ち・完了待ち・クローズ待ちの粗い帯で進行しうる（docs/project-status.md、docs/data-model-flowchart.md）。予約・稼働割当・顧客と接続する。</p></div></td></tr><tr><td>Container</td><td><a href=#31bd3274-d6cc-4b12-b16a-bebd0547d2a7><span class="name-container">プロジェクト</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.3.2.1.3 **Project** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。プロジェクトの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#36b2569b-bfb3-41d0-ae9f-76afa7a2e51f class="margin-0">Sales_Employee_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>営業担当社員ID。案件を持つ営業（Employee）への参照。Role 営業と整合。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#c43cfbf6-3fe1-4a58-bde7-44eaed0f69ac class="margin-0">Description</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>案件説明。概要・備考など自由記述。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#aac40d18-0693-4f94-b16b-207b1f53b68d class="margin-0">Attachments</a></td><td class="no-break-word">binary</td><td>false</td><td></td><td><div class="docs-markdown"><p>添付ファイル。見積・契約書などバイナリを格納しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#15e3fe41-d571-4ddc-93c6-926b0d8602e3 class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス大分類ID。受注・要因確定待ち・完了待ち・クローズ待ちのいずれか（docs/project-status.md）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#caf6b5e3-57c3-4f78-8049-2a01e0033ce8 class="margin-0">Sub_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（要員予約待ち・稼働中 等、案・運用で拡張）を表すマスタ参照。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901071 class="margin-0">Customer_Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>顧客名。案件に紐づく顧客の表示名（Acter 顧客のラベルに相当）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901072 class="margin-0">Period_Start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>案件期間開始日。インデックス対象。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901073 class="margin-0">Period_End</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>案件期間終了日。インデックス対象。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="697788b9-0c45-4fe7-92ac-deb3663ef79b"></a>2.3.2.1.3.1 Attribute **Id**

##### 2.3.2.1.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。プロジェクトの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="36b2569b-bfb3-41d0-ae9f-76afa7a2e51f"></a>2.3.2.1.3.2 Attribute **Sales\_Employee\_Id**

##### 2.3.2.1.3.2.1 **Sales\_Employee\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sales_Employee_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>営業担当社員ID。案件を持つ営業（Employee）への参照。Role 営業と整合。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td></tr><tr><td>Foreign field</td><td><a href=#df0adbb7-d544-413b-aded-7b7cc055d0f6>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="c43cfbf6-3fe1-4a58-bde7-44eaed0f69ac"></a>2.3.2.1.3.3 Attribute **Description**

##### 2.3.2.1.3.3.1 **Description** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Description</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>案件説明。概要・備考など自由記述。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="aac40d18-0693-4f94-b16b-207b1f53b68d"></a>2.3.2.1.3.4 Attribute **Attachments**

##### 2.3.2.1.3.4.1 **Attachments** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Attachments</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>binary</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>添付ファイル。見積・契約書などバイナリを格納しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="15e3fe41-d571-4ddc-93c6-926b0d8602e3"></a>2.3.2.1.3.5 Attribute **Main\_Status\_Id**

##### 2.3.2.1.3.5.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス大分類ID。受注・要因確定待ち・完了待ち・クローズ待ちのいずれか（docs/project-status.md）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="caf6b5e3-57c3-4f78-8049-2a01e0033ce8"></a>2.3.2.1.3.6 Attribute **Sub\_Status\_Id**

##### 2.3.2.1.3.6.1 **Sub\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sub_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（要員予約待ち・稼働中 等、案・運用で拡張）を表すマスタ参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901071"></a>2.3.2.1.3.7 Attribute **Customer\_Name**

##### 2.3.2.1.3.7.1 **Customer\_Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Customer_Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>顧客名。案件に紐づく顧客の表示名（Acter 顧客のラベルに相当）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901072"></a>2.3.2.1.3.8 Attribute **Period\_Start**

##### 2.3.2.1.3.8.1 **Period\_Start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_Start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>案件期間開始日。インデックス対象。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901073"></a>2.3.2.1.3.9 Attribute **Period\_End**

##### 2.3.2.1.3.9.1 **Period\_End** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_End</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>案件期間終了日。インデックス対象。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

##### 2.3.2.1.4 **Project** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f"></a>2.3.2.2 Entity **Main\_Status\_Project**

##### 2.3.2.2.1 **Main\_Status\_Project** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image21.png?raw=true)

##### 2.3.2.2.2 **Main\_Status\_Project** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Main_Status_Project</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>プロジェクトのステータス大分類マスタ。受注・要因確定待ち・完了待ち・クローズ待ちの粗い帯（docs/project-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#31bd3274-d6cc-4b12-b16a-bebd0547d2a7><span class="name-container">プロジェクト</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.3.2.2.3 **Main\_Status\_Project** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, fk, dk</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#45a5bac6-3b5e-4bc6-9704-36463b2c6fba class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。プロジェクト大分類のラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#2d700f30-3b38-4961-93a7-384a1e83cd10 class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="699596ab-463e-45e0-ba0a-41f0c521ab48"></a>2.3.2.2.3.1 Attribute **Id**

##### 2.3.2.2.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Foreign field</td><td><a href=#15e3fe41-d571-4ddc-93c6-926b0d8602e3>Main_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="45a5bac6-3b5e-4bc6-9704-36463b2c6fba"></a>2.3.2.2.3.2 Attribute **Name**

##### 2.3.2.2.3.2.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。プロジェクト大分類のラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="2d700f30-3b38-4961-93a7-384a1e83cd10"></a>2.3.2.2.3.3 Attribute **Sort\_Order**

##### 2.3.2.2.3.3.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.3.2.2.4 **Main\_Status\_Project** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="427cb85d-c62e-4bf3-a7f2-69cbee6f56d5"></a>2.3.2.3 Entity **Sub\_Status\_Project**

##### 2.3.2.3.1 **Sub\_Status\_Project** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image22.png?raw=true)

##### 2.3.2.3.2 **Sub\_Status\_Project** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Sub_Status_Project</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>プロジェクトのステータス小分類マスタ。各大分類に属する詳細（要員予約待ち・稼働中 等、案は docs/project-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#31bd3274-d6cc-4b12-b16a-bebd0547d2a7><span class="name-container">プロジェクト</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.3.2.3.3 **Sub\_Status\_Project** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#ceb4b08a-f5c2-4c2d-9bf6-e3798aee4f83 class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, fk</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#570515bf-fb49-45fd-b000-5094553509bb class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_Project への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#5359d1b8-6f09-4ee6-9205-3c1b70346932 class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。プロジェクト小分類のラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#76e88961-019c-4f51-89bd-ea98c8814372 class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="ceb4b08a-f5c2-4c2d-9bf6-e3798aee4f83"></a>2.3.2.3.3.1 Attribute **Id**

##### 2.3.2.3.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Foreign field</td><td><a href=#caf6b5e3-57c3-4f78-8049-2a01e0033ce8>Sub_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="570515bf-fb49-45fd-b000-5094553509bb"></a>2.3.2.3.3.2 Attribute **Main\_Status\_Id**

##### 2.3.2.3.3.2.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_Project への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f>Main_Status_Project</a></td></tr><tr><td>Foreign field</td><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="5359d1b8-6f09-4ee6-9205-3c1b70346932"></a>2.3.2.3.3.3 Attribute **Name**

##### 2.3.2.3.3.3.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。プロジェクト小分類のラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="76e88961-019c-4f51-89bd-ea98c8814372"></a>2.3.2.3.3.4 Attribute **Sort\_Order**

##### 2.3.2.3.3.4.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.3.2.3.4 **Sub\_Status\_Project** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="43b4e1fb-760a-44f1-9b62-0e1c42ee7cee"></a>2.4 Container **稼働割当**

##### 2.4.1 **稼働割当** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Container name</td><td>稼働割当</td></tr><tr><td>Activated</td><td>true</td></tr></tbody></table>

### <a id="43b4e1fb-760a-44f1-9b62-0e1c42ee7cee-children"></a>2.4.2 **稼働割当** Entities

### <a id="d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3"></a>2.4.2.1 Entity **WorkAssignment**

##### 2.4.2.1.1 **WorkAssignment** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image23.png?raw=true)

##### 2.4.2.1.2 **WorkAssignment** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>WorkAssignment</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>Transaction（Tr）。予約が大分類・確定待ちかつ小分類・予約完了に達したあとに生成される稼働コミット。本流は稼働待ちから稼働終了待ち、稼働終了へ進み、無効へ分岐しうる（docs/work-assignment-status.md、docs/data-model-flowchart.md）。プロジェクト・予約・スタッフと関連する。</p></div></td></tr><tr><td>Container</td><td><a href=#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee><span class="name-container">稼働割当</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.4.2.1.3 **WorkAssignment** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#e6050c31-0c06-4897-85bd-d17b84363d4c class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, dk</td><td><div class="docs-markdown"><p>識別子。稼働割当レコードの主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#b966757a-fb69-4337-9872-f8dca42cc313 class="margin-0">StaffingOrder_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>元予約ID。生成元となった StaffingOrder（予約Tr）への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#5a5db95c-dc04-42a2-a274-2ca272bb37b3 class="margin-0">Project_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>プロジェクトID。稼働先の案件（Project）への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#39b52248-d4d0-42fd-a147-913db77730e1 class="margin-0">Staff_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>dk</td><td><div class="docs-markdown"><p>スタッフID。割当先要員（社員またはBPの共通 Staff）への参照。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#3d041159-5f84-43b9-a3ff-c44a1de58577 class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス大分類ID。稼働待ち・稼働終了待ち・稼働終了・無効のいずれかを表すマスタ参照（docs/work-assignment-status.md）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#d5c81dee-cd93-4ae1-b3d4-9838222d4e3f class="margin-0">Sub_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>dk</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（例: 開始日待ち・準備中・稼働中・更新確認中・途中離脱 等）を表すマスタ参照。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901091 class="margin-0">Period_Start</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>稼働期間開始日。検索・集計用にインデックスを付与しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901092 class="margin-0">Period_End</a></td><td class="no-break-word">date</td><td>false</td><td></td><td><div class="docs-markdown"><p>稼働期間終了日。検索・集計用にインデックスを付与しうる。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="e6050c31-0c06-4897-85bd-d17b84363d4c"></a>2.4.2.1.3.1 Attribute **Id**

##### 2.4.2.1.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。稼働割当レコードの主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr></tbody></table>

### <a id="b966757a-fb69-4337-9872-f8dca42cc313"></a>2.4.2.1.3.2 Attribute **StaffingOrder\_Id**

##### 2.4.2.1.3.2.1 **StaffingOrder\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>StaffingOrder_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>元予約ID。生成元となった StaffingOrder（予約Tr）への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Foreign field</td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="5a5db95c-dc04-42a2-a274-2ca272bb37b3"></a>2.4.2.1.3.3 Attribute **Project\_Id**

##### 2.4.2.1.3.3.1 **Project\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Project_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>プロジェクトID。稼働先の案件（Project）への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Foreign field</td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="39b52248-d4d0-42fd-a147-913db77730e1"></a>2.4.2.1.3.4 Attribute **Staff\_Id**

##### 2.4.2.1.3.4.1 **Staff\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Staff_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>スタッフID。割当先要員（社員またはBPの共通 Staff）への参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="3d041159-5f84-43b9-a3ff-c44a1de58577"></a>2.4.2.1.3.5 Attribute **Main\_Status\_Id**

##### 2.4.2.1.3.5.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス大分類ID。稼働待ち・稼働終了待ち・稼働終了・無効のいずれかを表すマスタ参照（docs/work-assignment-status.md）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="d5c81dee-cd93-4ae1-b3d4-9838222d4e3f"></a>2.4.2.1.3.6 Attribute **Sub\_Status\_Id**

##### 2.4.2.1.3.6.1 **Sub\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sub_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>ステータス小分類ID。各大分類内の詳細（例: 開始日待ち・準備中・稼働中・更新確認中・途中離脱 等）を表すマスタ参照。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901091"></a>2.4.2.1.3.7 Attribute **Period\_Start**

##### 2.4.2.1.3.7.1 **Period\_Start** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_Start</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働期間開始日。検索・集計用にインデックスを付与しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901092"></a>2.4.2.1.3.8 Attribute **Period\_End**

##### 2.4.2.1.3.8.1 **Period\_End** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Period_End</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働期間終了日。検索・集計用にインデックスを付与しうる。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

##### 2.4.2.1.4 **WorkAssignment** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901041"></a>2.4.2.2 Entity **WorkAssignmentMonthlyAllocation**

##### 2.4.2.2.1 **WorkAssignmentMonthlyAllocation** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image24.png?raw=true)

##### 2.4.2.2.2 **WorkAssignmentMonthlyAllocation** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>WorkAssignmentMonthlyAllocation</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働割当の月別工数内訳。親 WorkAssignment の期間に沿って、年月ごとの effort を保持する。</p></div></td></tr><tr><td>Container</td><td><a href=#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee><span class="name-container">稼働割当</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.4.2.2.3 **WorkAssignmentMonthlyAllocation** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901051 class="margin-0">Work_Assignment_Id</a></td><td class="no-break-word">nvarchar</td><td>true</td><td>fk</td><td><div class="docs-markdown"><p>稼働割当ID。親 WorkAssignment への外部キー（複合主キーの一部）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901052 class="margin-0">Year_Month</a></td><td class="no-break-word">date</td><td>true</td><td></td><td><div class="docs-markdown"><p>対象年月。日付型で月を表す（その月の代表日など、実装で正規化）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901053 class="margin-0">Effort</a></td><td class="no-break-word">float</td><td>true</td><td></td><td><div class="docs-markdown"><p>工数。当該年月に配分した稼働量（実数）。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901051"></a>2.4.2.2.3.1 Attribute **Work\_Assignment\_Id**

##### 2.4.2.2.3.1.1 **Work\_Assignment\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Work_Assignment_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働割当ID。親 WorkAssignment への外部キー（複合主キーの一部）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Foreign field</td><td><a href=#e6050c31-0c06-4897-85bd-d17b84363d4c>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901052"></a>2.4.2.2.3.2 Attribute **Year\_Month**

##### 2.4.2.2.3.2.1 **Year\_Month** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Year_Month</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>date</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>対象年月。日付型で月を表す（その月の代表日など、実装で正規化）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr></tbody></table>

### <a id="a1b2c3d4-e5f6-4789-a012-345678901053"></a>2.4.2.2.3.3 Attribute **Effort**

##### 2.4.2.2.3.3.1 **Effort** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Effort</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>float</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>工数。当該年月に配分した稼働量（実数）。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Required</td><td>true</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.4.2.2.4 **WorkAssignmentMonthlyAllocation** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="b960eb07-bdd2-4298-9069-8ae51c9d735d"></a>2.4.2.3 Entity **Main\_Status\_WorkAssignment**

##### 2.4.2.3.1 **Main\_Status\_WorkAssignment** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image25.png?raw=true)

##### 2.4.2.3.2 **Main\_Status\_WorkAssignment** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Main_Status_WorkAssignment</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働割当のステータス大分類マスタ。稼働待ち・稼働終了待ち・稼働終了・無効（docs/work-assignment-status.md）。</p></div></td></tr><tr><td>Container</td><td><a href=#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee><span class="name-container">稼働割当</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.4.2.3.3 **Main\_Status\_WorkAssignment** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, fk, dk</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#cbe2c1fb-626b-4e5c-85c8-9241cd53548d class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。稼働割当の大分類ラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#e50274bf-9c06-4f88-a39d-4b25d8a97d11 class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="9cbeb48e-7446-4edd-b469-790dfbeaf98a"></a>2.4.2.3.3.1 Attribute **Id**

##### 2.4.2.3.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。大分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Foreign field</td><td><a href=#3d041159-5f84-43b9-a3ff-c44a1de58577>Main_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="cbe2c1fb-626b-4e5c-85c8-9241cd53548d"></a>2.4.2.3.3.2 Attribute **Name**

##### 2.4.2.3.3.2.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。稼働割当の大分類ラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="e50274bf-9c06-4f88-a39d-4b25d8a97d11"></a>2.4.2.3.3.3 Attribute **Sort\_Order**

##### 2.4.2.3.3.3.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。一覧や選択肢での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.4.2.3.4 **Main\_Status\_WorkAssignment** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="e86ef3e8-5f88-4613-b6ce-050fc5ae40c7"></a>2.4.2.4 Entity **Sub\_Status\_WorkAssignment**

##### 2.4.2.4.1 **Sub\_Status\_WorkAssignment** Tree Diagram

![Hackolade image](AutoAssignAgent_DataModel/image26.png?raw=true)

##### 2.4.2.4.2 **Sub\_Status\_WorkAssignment** Properties

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Entity name</td><td>Sub_Status_WorkAssignment</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>稼働割当のステータス小分類マスタ。各大分類に属する詳細（開始日待ち・準備中・稼働中 等、docs/work-assignment-status.md §3.5）。</p></div></td></tr><tr><td>Container</td><td><a href=#43b4e1fb-760a-44f1-9b62-0e1c42ee7cee><span class="name-container">稼働割当</span></a></td></tr><tr><td>Additional properties</td><td>false</td></tr></tbody></table>

##### 2.4.2.4.3 **Sub\_Status\_WorkAssignment** Attribute

<table><thead><tr><td>Attribute</td><td>Type</td><td>Req</td><td>Key</td><td>Description</td><td>Comments</td></tr></thead><tbody><tr><td><a href=#6c72b822-1065-411c-89c3-f90bc1f0dd4d class="margin-0">Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>pk, fk</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#0fe1b06c-597e-4718-8198-6bbc01abb025 class="margin-0">Main_Status_Id</a></td><td class="no-break-word">nvarchar</td><td>false</td><td>fk</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_WorkAssignment への外部キー。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#18721fd0-090b-4ca4-bd39-48a216b7382d class="margin-0">Name</a></td><td class="no-break-word">ntext</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示名。稼働割当の小分類ラベル。</p></div></td><td><div class="docs-markdown"></div></td></tr><tr><td><a href=#3e8ee5ce-39c1-4178-b49c-8c134e0d289d class="margin-0">Sort_Order</a></td><td class="no-break-word">int32</td><td>false</td><td></td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td><td><div class="docs-markdown"></div></td></tr></tbody></table>

### <a id="6c72b822-1065-411c-89c3-f90bc1f0dd4d"></a>2.4.2.4.3.1 Attribute **Id**

##### 2.4.2.4.3.1.1 **Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>識別子。小分類マスタ行の主キー（UUID）。</p></div></td></tr><tr><td>Primary key</td><td>true</td></tr><tr><td>Foreign entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Foreign field</td><td><a href=#d5c81dee-cd93-4ae1-b3d4-9838222d4e3f>Sub_Status_Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="0fe1b06c-597e-4718-8198-6bbc01abb025"></a>2.4.2.4.3.2 Attribute **Main\_Status\_Id**

##### 2.4.2.4.3.2.1 **Main\_Status\_Id** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Main_Status_Id</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>大分類ID。属する Main_Status_WorkAssignment への外部キー。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Foreign entity</td><td><a href=#b960eb07-bdd2-4298-9069-8ae51c9d735d>Main_Status_WorkAssignment</a></td></tr><tr><td>Foreign field</td><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a>Id</a></td></tr><tr><td>Relationship type</td><td>Foreign Key</td></tr></tbody></table>

### <a id="18721fd0-090b-4ca4-bd39-48a216b7382d"></a>2.4.2.4.3.3 Attribute **Name**

##### 2.4.2.4.3.3.1 **Name** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Name</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>nvarchar</td></tr><tr><td>Synonym</td><td>ntext</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示名。稼働割当の小分類ラベル。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr></tbody></table>

### <a id="3e8ee5ce-39c1-4178-b49c-8c134e0d289d"></a>2.4.2.4.3.4 Attribute **Sort\_Order**

##### 2.4.2.4.3.4.1 **Sort\_Order** properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Business Name</td><td>Sort_Order</td></tr><tr><td>Activated</td><td>true</td></tr><tr><td>Type</td><td>integer</td></tr><tr><td>Synonym</td><td>int32</td></tr><tr><td>Description</td><td><div class="docs-markdown"><p>表示順。同一主分類内での並び。</p></div></td></tr><tr><td>Primary key</td><td>false</td></tr><tr><td>Excl min</td><td>false</td></tr><tr><td>Excl max</td><td>false</td></tr></tbody></table>

##### 2.4.2.4.4 **Sub\_Status\_WorkAssignment** Composite keys

<table class="collection-properties-table"><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody></tbody></table>

### <a id="relationships"></a>

##### 3\. Relationships

### <a id="dcca2278-19b4-4f37-a024-4261a85c6705"></a>3.1 Relationship **fk StaffingOrder.ProjectId to Project.Id**

##### 3.1.1 **fk StaffingOrder.ProjectId to Project.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image27.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image28.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td><td><a href=#4de736bf-1223-4782-9e49-3e6fbd6f92a5>Project_Id</a></td></tr></tbody></table>

##### 3.1.2 **fk StaffingOrder.ProjectId to Project.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffingOrder.ProjectId to Project.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Parent Attribute</td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Child Attribute</td><td><a href=#4de736bf-1223-4782-9e49-3e6fbd6f92a5>Project_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="d707681d-a84e-4cd5-8873-e1560995d533"></a>3.2 Relationship **fk Project.Sales\_Employee\_Id to Employee.Id**

##### 3.2.1 **fk Project.Sales\_Employee\_Id to Employee.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td><td><a href=#df0adbb7-d544-413b-aded-7b7cc055d0f6>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image29.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image30.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td><td><a href=#36b2569b-bfb3-41d0-ae9f-76afa7a2e51f>Sales_Employee_Id</a></td></tr></tbody></table>

##### 3.2.2 **fk Project.Sales\_Employee\_Id to Employee.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Project.Sales_Employee_Id to Employee.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td></tr><tr><td>Parent Attribute</td><td><a href=#df0adbb7-d544-413b-aded-7b7cc055d0f6>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Child Attribute</td><td><a href=#36b2569b-bfb3-41d0-ae9f-76afa7a2e51f>Sales_Employee_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="5f2cb9b8-7e99-406b-8c82-ea1f95e89138"></a>3.3 Relationship **fk WorkAssignment.StaffingOrder\_Id to StaffingOrder.Id**

##### 3.3.1 **fk WorkAssignment.StaffingOrder\_Id to StaffingOrder.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image31.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image32.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#b966757a-fb69-4337-9872-f8dca42cc313>StaffingOrder_Id</a></td></tr></tbody></table>

##### 3.3.2 **fk WorkAssignment.StaffingOrder\_Id to StaffingOrder.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk WorkAssignment.StaffingOrder_Id to StaffingOrder.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Parent Attribute</td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Child Attribute</td><td><a href=#b966757a-fb69-4337-9872-f8dca42cc313>StaffingOrder_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="7f58d1b6-2468-42b5-be05-48e875c1ba17"></a>3.4 Relationship **fk Employee.Role\_Id to Role.Id**

##### 3.4.1 **fk Employee.Role\_Id to Role.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image33.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image34.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td><td><a href=#a089a46e-8ba1-44c4-bbdb-4cfad826a0a1>Role_Id</a></td></tr></tbody></table>

##### 3.4.2 **fk Employee.Role\_Id to Role.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Employee.Role_Id to Role.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Parent Attribute</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td></tr><tr><td>Child Attribute</td><td><a href=#a089a46e-8ba1-44c4-bbdb-4cfad826a0a1>Role_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="2c4204af-454c-4326-83d1-0b69bf11ef43"></a>3.5 Relationship **fk WorkAssignment.Project\_Id to Project.Id**

##### 3.5.1 **fk WorkAssignment.Project\_Id to Project.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image35.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image36.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#5a5db95c-dc04-42a2-a274-2ca272bb37b3>Project_Id</a></td></tr></tbody></table>

##### 3.5.2 **fk WorkAssignment.Project\_Id to Project.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk WorkAssignment.Project_Id to Project.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Parent Attribute</td><td><a href=#697788b9-0c45-4fe7-92ac-deb3663ef79b>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Child Attribute</td><td><a href=#5a5db95c-dc04-42a2-a274-2ca272bb37b3>Project_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="4f06ee06-921e-4c86-b96f-8a97ab8023bb"></a>3.6 Relationship **fk Staff.Role\_Id to Role.Id**

##### 3.6.1 **fk Staff.Role\_Id to Role.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image37.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image38.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#8f341593-620c-4cea-a2c3-284a403eea72>Role_Id</a></td></tr></tbody></table>

##### 3.6.2 **fk Staff.Role\_Id to Role.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Staff.Role_Id to Role.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Parent Attribute</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Child Attribute</td><td><a href=#8f341593-620c-4cea-a2c3-284a403eea72>Role_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="5fb50e3a-7ee8-40af-b725-c39f266d22a2"></a>3.7 Relationship **fk Employee.Staff\_Id to Staff.Id**

##### 3.7.1 **fk Employee.Staff\_Id to Staff.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image39.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image40.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td><td><a href=#d0f62abe-3b22-42ff-8e1c-7ff147bc195b>Staff_Id</a></td></tr></tbody></table>

##### 3.7.2 **fk Employee.Staff\_Id to Staff.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Employee.Staff_Id to Staff.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Parent Attribute</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#7722533f-7242-4c5a-9535-44e7c539fb6f>Employee</a></td></tr><tr><td>Child Attribute</td><td><a href=#d0f62abe-3b22-42ff-8e1c-7ff147bc195b>Staff_Id</a></td></tr><tr><td>Child Cardinality</td><td>0..1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="9d315ea1-5b60-4f4d-b542-dc80d60de36c"></a>3.8 Relationship **fk Employee.Role\_Id to Role.Id**

##### 3.8.1 **fk Employee.Role\_Id to Role.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image41.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image42.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#2be3c97d-483a-474f-b219-cfbabfe4e88f>Business_Partner</a></td><td><a href=#ab758ee7-9e41-4214-9dbe-c6db17e06df3>Role_Id</a></td></tr></tbody></table>

##### 3.8.2 **fk Employee.Role\_Id to Role.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Employee.Role_Id to Role.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Parent Attribute</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#2be3c97d-483a-474f-b219-cfbabfe4e88f>Business_Partner</a></td></tr><tr><td>Child Attribute</td><td><a href=#ab758ee7-9e41-4214-9dbe-c6db17e06df3>Role_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="898b0089-d41a-47a7-84f6-fc3473741671"></a>3.9 Relationship **fk Employee.Staff\_Id to Staff.Id**

##### 3.9.1 **fk Employee.Staff\_Id to Staff.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image43.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image44.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#2be3c97d-483a-474f-b219-cfbabfe4e88f>Business_Partner</a></td><td><a href=#fbf73a6f-8e0e-401e-a9da-0a10e934c83a>Staff_Id</a></td></tr></tbody></table>

##### 3.9.2 **fk Employee.Staff\_Id to Staff.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Employee.Staff_Id to Staff.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Parent Attribute</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#2be3c97d-483a-474f-b219-cfbabfe4e88f>Business_Partner</a></td></tr><tr><td>Child Attribute</td><td><a href=#fbf73a6f-8e0e-401e-a9da-0a10e934c83a>Staff_Id</a></td></tr><tr><td>Child Cardinality</td><td>0..1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="2343d276-8a20-43ff-8c4a-2b94d2835be6"></a>3.10 Relationship **fk Staff.Id to WorkAssignment.Staff\_Id**

##### 3.10.1 **fk Staff.Id to WorkAssignment.Staff\_Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#39b52248-d4d0-42fd-a147-913db77730e1>Staff_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image45.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image46.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr></tbody></table>

##### 3.10.2 **fk Staff.Id to WorkAssignment.Staff\_Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Staff.Id to WorkAssignment.Staff_Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Parent Attribute</td><td><a href=#39b52248-d4d0-42fd-a147-913db77730e1>Staff_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Child Attribute</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="415a9e32-a353-4ed3-bbf2-57531e5a7ad3"></a>3.11 Relationship **fk Sub\_Status.Main\_Status\_Id to Main\_Status.Id**

##### 3.11.1 **fk Sub\_Status.Main\_Status\_Id to Main\_Status.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#d3cc3aa9-6ec9-4409-b35b-01cae6352f56>Main_Status_StaffingOrder</a></td><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image47.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image48.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#83f1137b-4e38-4a42-b17d-89d969485107>Sub_Status_StaffingOrder</a></td><td><a href=#5ce306f3-3cbe-4d07-ba7e-442c7dcda5ce>Main_Status_Id</a></td></tr></tbody></table>

##### 3.11.2 **fk Sub\_Status.Main\_Status\_Id to Main\_Status.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status.Main_Status_Id to Main_Status.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#d3cc3aa9-6ec9-4409-b35b-01cae6352f56>Main_Status_StaffingOrder</a></td></tr><tr><td>Parent Attribute</td><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#83f1137b-4e38-4a42-b17d-89d969485107>Sub_Status_StaffingOrder</a></td></tr><tr><td>Child Attribute</td><td><a href=#5ce306f3-3cbe-4d07-ba7e-442c7dcda5ce>Main_Status_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="39b9ed50-d1f8-4148-8a5a-dc099d2cfc45"></a>3.12 Relationship **fk Main\_Status.Id to StaffingOrder.Main\_Status**

##### 3.12.1 **fk Main\_Status.Id to StaffingOrder.Main\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td><td><a href=#719b6b39-9b73-4bc8-9526-daa6c8a939ea>Main_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image49.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image50.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#d3cc3aa9-6ec9-4409-b35b-01cae6352f56>Main_Status_StaffingOrder</a></td><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98>Id</a></td></tr></tbody></table>

##### 3.12.2 **fk Main\_Status.Id to StaffingOrder.Main\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Main_Status.Id to StaffingOrder.Main_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Parent Attribute</td><td><a href=#719b6b39-9b73-4bc8-9526-daa6c8a939ea>Main_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#d3cc3aa9-6ec9-4409-b35b-01cae6352f56>Main_Status_StaffingOrder</a></td></tr><tr><td>Child Attribute</td><td><a href=#8686734e-d824-4979-b5e9-d5b9d8fd5d98>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="5dde96c3-c44e-4ad0-8117-cb0c2064de1f"></a>3.13 Relationship **fk Sub\_Status.Id to StaffingOrder.Sub\_Status**

##### 3.13.1 **fk Sub\_Status.Id to StaffingOrder.Sub\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td><td><a href=#795e843e-eebc-4053-a4d0-5f10f726330d>Sub_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image51.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image52.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#83f1137b-4e38-4a42-b17d-89d969485107>Sub_Status_StaffingOrder</a></td><td><a href=#64b68477-5191-422f-979c-caebff634dc4>Id</a></td></tr></tbody></table>

##### 3.13.2 **fk Sub\_Status.Id to StaffingOrder.Sub\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status.Id to StaffingOrder.Sub_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Parent Attribute</td><td><a href=#795e843e-eebc-4053-a4d0-5f10f726330d>Sub_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#83f1137b-4e38-4a42-b17d-89d969485107>Sub_Status_StaffingOrder</a></td></tr><tr><td>Child Attribute</td><td><a href=#64b68477-5191-422f-979c-caebff634dc4>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="e6c44ed0-f809-4c6f-87df-f77b802e178e"></a>3.14 Relationship **fk Main\_Status.Id to Project.Main\_Status**

##### 3.14.1 **fk Main\_Status.Id to Project.Main\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td><td><a href=#15e3fe41-d571-4ddc-93c6-926b0d8602e3>Main_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image53.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image54.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f>Main_Status_Project</a></td><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48>Id</a></td></tr></tbody></table>

##### 3.14.2 **fk Main\_Status.Id to Project.Main\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Main_Status.Id to Project.Main_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Parent Attribute</td><td><a href=#15e3fe41-d571-4ddc-93c6-926b0d8602e3>Main_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f>Main_Status_Project</a></td></tr><tr><td>Child Attribute</td><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="e9b43148-9168-4c4d-afa2-d150af82b369"></a>3.15 Relationship **fk Sub\_Status(1).Id to Project.Sub\_Status**

##### 3.15.1 **fk Sub\_Status(1).Id to Project.Sub\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td><td><a href=#caf6b5e3-57c3-4f78-8049-2a01e0033ce8>Sub_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image55.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image56.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#427cb85d-c62e-4bf3-a7f2-69cbee6f56d5>Sub_Status_Project</a></td><td><a href=#ceb4b08a-f5c2-4c2d-9bf6-e3798aee4f83>Id</a></td></tr></tbody></table>

##### 3.15.2 **fk Sub\_Status(1).Id to Project.Sub\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status(1).Id to Project.Sub_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#b351e292-4128-4bb7-91c6-4b0c069dec74>Project</a></td></tr><tr><td>Parent Attribute</td><td><a href=#caf6b5e3-57c3-4f78-8049-2a01e0033ce8>Sub_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#427cb85d-c62e-4bf3-a7f2-69cbee6f56d5>Sub_Status_Project</a></td></tr><tr><td>Child Attribute</td><td><a href=#ceb4b08a-f5c2-4c2d-9bf6-e3798aee4f83>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="cf499803-5576-48a6-acfd-297d9ac4a0d6"></a>3.16 Relationship **fk Sub\_Status\_Project.Main\_Status\_Id to Main\_Status\_Project.Id**

##### 3.16.1 **fk Sub\_Status\_Project.Main\_Status\_Id to Main\_Status\_Project.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f>Main_Status_Project</a></td><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image57.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image58.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#427cb85d-c62e-4bf3-a7f2-69cbee6f56d5>Sub_Status_Project</a></td><td><a href=#570515bf-fb49-45fd-b000-5094553509bb>Main_Status_Id</a></td></tr></tbody></table>

##### 3.16.2 **fk Sub\_Status\_Project.Main\_Status\_Id to Main\_Status\_Project.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status_Project.Main_Status_Id to Main_Status_Project.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#44bb5641-62a0-4e43-ae99-0e3f7b0e4f7f>Main_Status_Project</a></td></tr><tr><td>Parent Attribute</td><td><a href=#699596ab-463e-45e0-ba0a-41f0c521ab48>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#427cb85d-c62e-4bf3-a7f2-69cbee6f56d5>Sub_Status_Project</a></td></tr><tr><td>Child Attribute</td><td><a href=#570515bf-fb49-45fd-b000-5094553509bb>Main_Status_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="5fa333a8-8b77-4b4b-b28f-abd7435e1ec6"></a>3.17 Relationship **fk Main\_Status\_Project(1).Id to WorkAssignment.Main\_Status**

##### 3.17.1 **fk Main\_Status\_Project(1).Id to WorkAssignment.Main\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#3d041159-5f84-43b9-a3ff-c44a1de58577>Main_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image59.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image60.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#b960eb07-bdd2-4298-9069-8ae51c9d735d>Main_Status_WorkAssignment</a></td><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a>Id</a></td></tr></tbody></table>

##### 3.17.2 **fk Main\_Status\_Project(1).Id to WorkAssignment.Main\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Main_Status_Project(1).Id to WorkAssignment.Main_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Parent Attribute</td><td><a href=#3d041159-5f84-43b9-a3ff-c44a1de58577>Main_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#b960eb07-bdd2-4298-9069-8ae51c9d735d>Main_Status_WorkAssignment</a></td></tr><tr><td>Child Attribute</td><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="87f52dd0-3aa4-45ed-9abc-93e093b5cec6"></a>3.18 Relationship **fk Sub\_Status\_Project(1).Id to WorkAssignment.Sub\_Status**

##### 3.18.1 **fk Sub\_Status\_Project(1).Id to WorkAssignment.Sub\_Status** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#d5c81dee-cd93-4ae1-b3d4-9838222d4e3f>Sub_Status_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image61.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image62.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#e86ef3e8-5f88-4613-b6ce-050fc5ae40c7>Sub_Status_WorkAssignment</a></td><td><a href=#6c72b822-1065-411c-89c3-f90bc1f0dd4d>Id</a></td></tr></tbody></table>

##### 3.18.2 **fk Sub\_Status\_Project(1).Id to WorkAssignment.Sub\_Status** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status_Project(1).Id to WorkAssignment.Sub_Status</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Parent Attribute</td><td><a href=#d5c81dee-cd93-4ae1-b3d4-9838222d4e3f>Sub_Status_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#e86ef3e8-5f88-4613-b6ce-050fc5ae40c7>Sub_Status_WorkAssignment</a></td></tr><tr><td>Child Attribute</td><td><a href=#6c72b822-1065-411c-89c3-f90bc1f0dd4d>Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="f0a6c69c-7805-407a-873a-7254ffe89fde"></a>3.19 Relationship **fk Sub\_Status\_Project(1).Main\_Status\_Id to Main\_Status\_Project(1).Id**

##### 3.19.1 **fk Sub\_Status\_Project(1).Main\_Status\_Id to Main\_Status\_Project(1).Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#b960eb07-bdd2-4298-9069-8ae51c9d735d>Main_Status_WorkAssignment</a></td><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image63.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image64.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#e86ef3e8-5f88-4613-b6ce-050fc5ae40c7>Sub_Status_WorkAssignment</a></td><td><a href=#0fe1b06c-597e-4718-8198-6bbc01abb025>Main_Status_Id</a></td></tr></tbody></table>

##### 3.19.2 **fk Sub\_Status\_Project(1).Main\_Status\_Id to Main\_Status\_Project(1).Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk Sub_Status_Project(1).Main_Status_Id to Main_Status_Project(1).Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#b960eb07-bdd2-4298-9069-8ae51c9d735d>Main_Status_WorkAssignment</a></td></tr><tr><td>Parent Attribute</td><td><a href=#9cbeb48e-7446-4edd-b469-790dfbeaf98a>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#e86ef3e8-5f88-4613-b6ce-050fc5ae40c7>Sub_Status_WorkAssignment</a></td></tr><tr><td>Child Attribute</td><td><a href=#0fe1b06c-597e-4718-8198-6bbc01abb025>Main_Status_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="4fb17ddc-f925-4f11-96cb-0faec57bb0d8"></a>3.20 Relationship **fk StaffStatus.Staff\_Id to Staff.Id**

##### 3.20.1 **fk StaffStatus.Staff\_Id to Staff.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image65.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image66.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0>StaffStatus</a></td><td><a href=#55777e85-5f0d-40aa-950e-3f999361ce64>Staff_Id</a></td></tr></tbody></table>

##### 3.20.2 **fk StaffStatus.Staff\_Id to Staff.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffStatus.Staff_Id to Staff.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Parent Attribute</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0>StaffStatus</a></td></tr><tr><td>Child Attribute</td><td><a href=#55777e85-5f0d-40aa-950e-3f999361ce64>Staff_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="e0cc55e4-a3e8-42e2-941b-5bc2b5cc5183"></a>3.21 Relationship **fk StaffStatus.Status\_Id to Status\_Staff.Id**

##### 3.21.1 **fk StaffStatus.Status\_Id to Status\_Staff.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#ca58d02a-a7f1-4aa8-b8a3-617b1324047f>Status_Staff</a></td><td><a href=#213a2810-204b-4a64-a0e0-bdacfada5618>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image67.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image68.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0>StaffStatus</a></td><td><a href=#2c91d609-6ee4-4892-91cd-be9d04279863>Status_Id</a></td></tr></tbody></table>

##### 3.21.2 **fk StaffStatus.Status\_Id to Status\_Staff.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffStatus.Status_Id to Status_Staff.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#ca58d02a-a7f1-4aa8-b8a3-617b1324047f>Status_Staff</a></td></tr><tr><td>Parent Attribute</td><td><a href=#213a2810-204b-4a64-a0e0-bdacfada5618>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#385df7ee-e3fb-482d-8bb7-d9ac8a08d0c0>StaffStatus</a></td></tr><tr><td>Child Attribute</td><td><a href=#2c91d609-6ee4-4892-91cd-be9d04279863>Status_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="cb69c639-3bd9-499d-9c3f-7444b2e41497"></a>3.22 Relationship **fk StaffingOrderStaffResource.Staffing\_Order\_Id to StaffingOrder.Id**

##### 3.22.1 **fk StaffingOrderStaffResource.Staffing\_Order\_Id to StaffingOrder.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image69.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image70.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011>Staffing_Order_Id</a></td></tr></tbody></table>

##### 3.22.2 **fk StaffingOrderStaffResource.Staffing\_Order\_Id to StaffingOrder.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffingOrderStaffResource.Staffing_Order_Id to StaffingOrder.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#465ab053-9432-4c43-82ae-b0457f3c35cc>StaffingOrder</a></td></tr><tr><td>Parent Attribute</td><td><a href=#97fabd89-bdc3-419a-8094-fb4f5a7d9c21>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011>Staffing_Order_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="7cbf0d28-68ab-45b7-81b0-a47b614bc005"></a>3.23 Relationship **fk StaffingOrderStaffResource.Staff\_Id to Staff.Id**

##### 3.23.1 **fk StaffingOrderStaffResource.Staff\_Id to Staff.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image71.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image72.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012>Staff_Id</a></td></tr></tbody></table>

##### 3.23.2 **fk StaffingOrderStaffResource.Staff\_Id to Staff.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffingOrderStaffResource.Staff_Id to Staff.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#8e985525-5bf1-4633-945a-35054a47d5e1>Staff</a></td></tr><tr><td>Parent Attribute</td><td><a href=#692ca41a-893a-4498-aaec-7001ad6e7e81>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012>Staff_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="04b74808-1488-49ad-a0d9-cba4873b6b92"></a>3.24 Relationship **fk StaffingOrderStaffResource.Role\_Id to Role.Id**

##### 3.24.1 **fk StaffingOrderStaffResource.Role\_Id to Role.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image73.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image74.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901013>Role_Id</a></td></tr></tbody></table>

##### 3.24.2 **fk StaffingOrderStaffResource.Role\_Id to Role.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk StaffingOrderStaffResource.Role_Id to Role.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#2ffada2e-93f5-4524-a1b8-5164c9f84f7e>Role</a></td></tr><tr><td>Parent Attribute</td><td><a href=#02d54cc6-6dda-47b6-bc9d-69a66873770d>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901013>Role_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="c5899a2d-b315-4251-920c-b1541157e358"></a>3.25 Relationship **fk SOSRMonthlyAllocation.Staffing\_Order\_Id to StaffingOrderStaffResource.Staffing\_Order\_Id**

##### 3.25.1 **fk SOSRMonthlyAllocation.Staffing\_Order\_Id to StaffingOrderStaffResource.Staffing\_Order\_Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011>Staffing_Order_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image75.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image76.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901021>StaffingOrderStaffResourceMonthlyAllocation</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901031>Staffing_Order_Id</a></td></tr></tbody></table>

##### 3.25.2 **fk SOSRMonthlyAllocation.Staffing\_Order\_Id to StaffingOrderStaffResource.Staffing\_Order\_Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk SOSRMonthlyAllocation.Staffing_Order_Id to StaffingOrderStaffResource.Staffing_Order_Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Parent Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901011>Staffing_Order_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901021>StaffingOrderStaffResourceMonthlyAllocation</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901031>Staffing_Order_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="d0104edb-36b7-4c24-af38-1d6e73585c4a"></a>3.26 Relationship **fk SOSRMonthlyAllocation.Staff\_Id to StaffingOrderStaffResource.Staff\_Id**

##### 3.26.1 **fk SOSRMonthlyAllocation.Staff\_Id to StaffingOrderStaffResource.Staff\_Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012>Staff_Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image77.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image78.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901021>StaffingOrderStaffResourceMonthlyAllocation</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901032>Staff_Id</a></td></tr></tbody></table>

##### 3.26.2 **fk SOSRMonthlyAllocation.Staff\_Id to StaffingOrderStaffResource.Staff\_Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk SOSRMonthlyAllocation.Staff_Id to StaffingOrderStaffResource.Staff_Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901001>StaffingOrderStaffResource</a></td></tr><tr><td>Parent Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901012>Staff_Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901021>StaffingOrderStaffResourceMonthlyAllocation</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901032>Staff_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="bd9b0c49-e002-4ae4-be05-9b0de7ac64f7"></a>3.27 Relationship **fk WorkAssignmentMonthlyAllocation.Work\_Assignment\_Id to WorkAssignment.Id**

##### 3.27.1 **fk WorkAssignmentMonthlyAllocation.Work\_Assignment\_Id to WorkAssignment.Id** Diagram

<table><thead><tr><td>Parent Table</td><td>Parent Attribute</td></tr></thead><tbody><tr><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td><td><a href=#e6050c31-0c06-4897-85bd-d17b84363d4c>Id</a></td></tr></tbody></table>

![Hackolade image](AutoAssignAgent_DataModel/image79.png?raw=true)![Hackolade image](AutoAssignAgent_DataModel/image80.png?raw=true)

<table><thead><tr><td>Child Table</td><td>Child Attribute</td></tr></thead><tbody><tr><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901041>WorkAssignmentMonthlyAllocation</a></td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901051>Work_Assignment_Id</a></td></tr></tbody></table>

##### 3.27.2 **fk WorkAssignmentMonthlyAllocation.Work\_Assignment\_Id to WorkAssignment.Id** Properties

<table><thead><tr><td>Property</td><td>Value</td></tr></thead><tbody><tr><td>Name</td><td>fk WorkAssignmentMonthlyAllocation.Work_Assignment_Id to WorkAssignment.Id</td></tr><tr><td>Description</td><td></td></tr><tr><td>Parent Entity</td><td><a href=#d01f7501-dcb7-4e9b-9e3b-14a5a867fbe3>WorkAssignment</a></td></tr><tr><td>Parent Attribute</td><td><a href=#e6050c31-0c06-4897-85bd-d17b84363d4c>Id</a></td></tr><tr><td>Parent Cardinality</td><td>1</td></tr><tr><td>Child Entity</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901041>WorkAssignmentMonthlyAllocation</a></td></tr><tr><td>Child Attribute</td><td><a href=#a1b2c3d4-e5f6-4789-a012-345678901051>Work_Assignment_Id</a></td></tr><tr><td>Child Cardinality</td><td>1</td></tr><tr><td>Comments</td><td></td></tr></tbody></table>

### <a id="edges"></a>