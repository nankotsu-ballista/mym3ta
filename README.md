# MY META

> **統計ではなく「プレイヤーの思考」を共有し、最適なピックを導くWebサービス**

---

## 📌 概要

MY METAは、対人チームゲームにおけるキャラクターピックを最適化するためのWebアプリです。

従来の勝率などの統計データではなく、プレイヤー自身の戦略（メタ）を定義・共有し、  
それをもとに最適なキャラクターを推薦します。

---

## 🚀 主な機能

### 🧠 メタの作成・共有
- プレイヤーごとの戦略（メタ）を作成・保存
- 他ユーザーのメタを閲覧可能

### 🧩 テンプレート機能
- キャラクター一覧の定義
- マップやルールなどの状況設定
- メタ作成の土台を構築

### ⚙️ 相性設定（コア機能）

戦略を以下の4つの要素に分解して管理：

- **Counter**：敵との対面相性  
- **Synergy**：味方との相性  
- **Situation**：状況（マップなど）による強さ  
- **Base**：キャラクター単体の性能  

直感的な操作で設定可能（ドラッグ＆ドロップ）

---

### 🔍 検索機能
- ユーザー検索  
- ゲームごとの絞り込み  
- メタ検索  

---

### 🤖 Pick Recommender

入力された状況から最適なキャラクターを推薦

**入力**
- 味方キャラクター  
- 敵キャラクター  
- マップ・状況  

**出力**
- 推奨キャラクター上位5体（スコア付き）

---

## 🛠 技術スタック

### Backend
- Ruby on Rails

### Frontend
- HTML / CSS / SCSS
- JavaScript

### Database
- PostgreSQL（Render）

### Infrastructure
- Render（Web Service + PostgreSQL）

---

## ⚡ セットアップ

```bash
git clone https://github.com/your-repo.git
cd your-repo
bundle install
rails db:create db:migrate
rails s
