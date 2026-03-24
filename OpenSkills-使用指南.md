# OpenSkills 使用指南

> 面向当前仓库 `cocoa-skills` 的实际使用说明。
>
> 目标：帮助你理解 OpenSkills 的命令、安装方式、技能接入方式，以及如何控制技能给哪个 CLI 使用。

---

## 1. OpenSkills 是什么

OpenSkills 本质上是一个：

- 技能安装工具
- 技能映射工具
- 技能读取工具
- `AGENTS.md` 同步工具

它更像“技能接入层”，而不是“技能内容管理平台”。

### 适合做的事

- 从 GitHub、本地目录、私有仓库安装技能
- 让技能出现在约定目录中
- 生成 `AGENTS.md` 供其他 AI CLI 使用
- 统一读取 `SKILL.md`

### 不适合做的事

- 直接帮你创建技能内容
- 作为完整的技能管理后台
- 统一管理所有 CLI 的 agent 运行逻辑

---

## 2. 当前已安装方式

当前机器已经全局安装 OpenSkills，可以直接使用命令：

```bash
openskills --help
```

如果没有全局安装，也可以通过 `npx` 临时运行：

```bash
npx openskills --help
```

### 两种运行方式的区别

#### 方式一：全局安装后直接运行

```bash
openskills list
```

适合长期使用。

#### 方式二：通过 npx 临时运行

```bash
npx openskills list
```

适合试用或临时使用。

---

## 3. OpenSkills 有哪些命令

当前版本的核心命令有：

```bash
openskills list
openskills install [options] <source>
openskills read <skill-names...>
openskills update [skill-names...]
openskills sync [options]
openskills manage
openskills remove <skill-name>
```

---

## 4. 命令说明

### 4.1 查看技能列表

```bash
openskills list
```

#### 作用

查看 OpenSkills 当前能识别到的技能，包括：

- 项目级技能
- 全局技能

#### 常见用途

- 检查某个技能是否已经接入成功
- 确认当前环境有哪些技能可用

---

### 4.2 安装技能

```bash
openskills install <source>
```

#### 常见来源

##### 从 GitHub 仓库安装

```bash
openskills install anthropics/skills
```

##### 从你自己的 GitHub 仓库安装

```bash
openskills install yourname/your-skills-repo
```

##### 从本地目录安装

```bash
openskills install ./my-skill
```

##### 从私有 Git 仓库安装

```bash
openskills install git@github.com:your-org/private-skills.git
```

#### 常见参数

##### 安装到全局目录

```bash
openskills install anthropics/skills --global
```

##### 安装到通用目录

```bash
openskills install anthropics/skills --universal
```

#### 说明

- `--global` 通常用于全局技能目录
- `--universal` 更偏向 `.agent/skills` 这类通用目录

---

### 4.3 读取技能内容

```bash
openskills read review-pr
```

#### 一次读取多个技能

```bash
openskills read review-pr write-tests
```

#### 作用

把指定技能的 `SKILL.md` 内容输出到终端，供 agent 或 CLI 在需要时加载。

#### 使用意义

OpenSkills 的思路不是一开始把所有技能都塞进上下文，而是：

- 平时只保留技能索引
- 用到时再 `read`

这样更节省上下文。

---

### 4.4 更新技能

```bash
openskills update
```

#### 更新指定技能

```bash
openskills update review-pr
```

#### 作用

如果技能来自 git 仓库或可追踪来源，可以通过这个命令更新到最新版本。

---

### 4.5 同步 `AGENTS.md`

```bash
openskills sync
```

#### 常见用法

```bash
openskills sync -y
openskills sync -o AGENTS.md
```

#### 作用

把当前已安装或已启用的技能写入 `AGENTS.md`，让支持 `AGENTS.md` 的工具识别这些技能。

---

### 4.6 交互式管理技能

```bash
openskills manage
```

#### 作用

通常用于交互式删除或整理已安装技能。

---

### 4.7 删除技能

```bash
openskills remove review-pr
```

#### 作用

从 OpenSkills 管理目录中移除某个技能。

---

## 5. OpenSkills 能不能创建技能

### 结论

OpenSkills 本身不是技能创建器。

它主要负责：

- 安装技能
- 读取技能
- 更新技能
- 同步技能
- 删除技能

它并没有提供明确的 `create` 或 `new` 命令来帮你生成技能模板。

---

## 6. 技能怎么自己创建

你需要自己创建一个技能目录，并在里面放 `SKILL.md`。

### 最小目录结构

```txt
my-skill/
└── SKILL.md
```

### 最小示例

```md
---
name: my-skill
description: 这里写技能说明。
---

# My Skill

这里写技能的用途、步骤、输出要求和约束。
```

### 创建后怎么接入

#### 方式一：通过 OpenSkills 安装本地技能

```bash
openskills install ./my-skill
```

#### 方式二：手动放到约定目录

可以放到这些目录之一：

- `~/.claude/skills/`
- `./.claude/skills/`
- `~/.agent/skills/`
- `./.agent/skills/`

然后再执行：

```bash
openskills sync
```

---

## 7. 技能怎么下载

在 OpenSkills 里，“下载技能”通常就是指 `install`。

### 从远程仓库安装

```bash
openskills install anthropics/skills
```

### 从本地目录安装

```bash
openskills install ./skills/own/review-pr
```

### 安装到通用目录

```bash
openskills install anthropics/skills --universal
```

### 安装到全局目录

```bash
openskills install anthropics/skills --global
```

---

## 8. 技能能在哪个 CLI 使用

关键不在于“技能属于哪个 CLI”，而在于：

- 技能最终被放到了哪个目录
- 目标 CLI 是否支持那种发现方式

### OpenSkills 面向的常见工具

- Claude Code
- Cursor
- Windsurf
- Aider
- Codex
- 其他能读取 `AGENTS.md` 的工具

---

## 9. 怎么让技能给某个 CLI 使用

### 9.1 给 Claude Code 使用

把技能放到这些目录之一：

- `~/.claude/skills/`
- `./.claude/skills/`

这样 Claude Code 更容易识别到这些技能。

---

### 9.2 给通用 CLI 使用

把技能放到这些目录之一：

- `~/.agent/skills/`
- `./.agent/skills/`

然后执行：

```bash
openskills sync
```

这会生成或更新 `AGENTS.md`，让支持 `AGENTS.md` 的工具识别。

---

## 10. 怎么控制“给这个 CLI 用，不给那个 CLI 用”

这个问题的关键是：

> 通过技能所在目录和 `AGENTS.md` 的同步范围来控制。

---

### 10.1 只给 Claude Code 用

只把技能放到：

- `~/.claude/skills/`
- 或 `./.claude/skills/`

而不要放进：

- `.agent/skills/`
- 通用 `AGENTS.md` 对应目录

这样其他依赖 `.agent/skills` 或 `AGENTS.md` 的工具通常看不到。

---

### 10.2 只给通用 CLI 用

只把技能放到：

- `~/.agent/skills/`
- `./.agent/skills/`

然后执行：

```bash
openskills sync
```

而不要放进 `.claude/skills/`。

---

### 10.3 按项目隔离技能

不同项目可以维护不同技能集。

例如：

#### 项目 A
只暴露：

- `review-pr`
- `write-tests`

#### 项目 B
只暴露：

- `ui-audit`
- `frontend-design`

方法就是在不同项目里维护不同的：

- `./.claude/skills/`
- `./.agent/skills/`
- `AGENTS.md`

---

### 10.4 使用 enabled / disabled 分层

建议你自己的仓库保持这样的结构：

```txt
skills/
├── own/
├── external/
└── disabled/
```

#### 启用技能
映射到：

- `.claude/skills`
- `.agent/skills`

#### 暂不启用技能
放到：

- `skills/disabled/`

这样最容易长期维护。

---

## 11. 结合当前仓库的推荐工作流

你的目标是：

- 用 GitHub 仓库统一管理技能
- 通过 OpenSkills 做接入和分发
- 控制不同 CLI 使用不同技能集

所以建议采用下面的工作流。

### 第一步：仓库作为唯一技能源

例如：

```txt
skills/own/
skills/external/
skills/disabled/
```

所有技能先统一放在仓库中管理。

---

### 第二步：OpenSkills 只负责接入

#### 给 Claude Code 使用
把技能接到：

- `~/.claude/skills/`
- 或 `./.claude/skills/`

#### 给通用 CLI 使用
把技能接到：

- `~/.agent/skills/`
- 或 `./.agent/skills/`

然后执行：

```bash
openskills sync
```

---

### 第三步：不要让每个 CLI 各装一份副本

建议统一维护一份技能源，再把它映射给不同工具。

这样可以避免：

- 同一个技能多次下载
- 同一个技能重复更新
- 删除时要删很多份
- 不同工具之间版本不一致

---

## 12. 最常用命令速查

### 查看技能列表

```bash
openskills list
```

### 安装远程技能源

```bash
openskills install anthropics/skills
```

### 安装本地技能

```bash
openskills install ./skills/own/review-pr
```

### 读取技能

```bash
openskills read review-pr
```

### 更新全部技能

```bash
openskills update
```

### 同步生成 `AGENTS.md`

```bash
openskills sync
```

### 删除技能

```bash
openskills remove review-pr
```

---

## 13. 面向当前仓库的实际建议

当前仓库更适合作为：

- 技能主仓库
- GitHub 分享仓库
- 技能资产仓库

而 OpenSkills 负责：

- 把技能接到 Claude Code
- 把技能接到 `.agent/skills`
- 生成 `AGENTS.md`
- 让不同 CLI 读取这些技能

### 推荐职责划分

#### 当前仓库负责

- 编写技能
- 管理技能
- 版本控制
- 归档自有技能和外部技能

#### OpenSkills 负责

- 安装
- 映射
- 读取
- 同步

---

## 14. 一句话总结

### OpenSkills 是什么

- 技能安装器
- 技能映射器
- 技能读取器
- `AGENTS.md` 同步器

### OpenSkills 不是什么

- 技能编辑器
- 技能内容管理后台
- 通用 agent 编排平台

### 如何控制技能给哪个 CLI 使用

通过以下两点控制：

1. 技能安装或映射到哪个目录
2. 是否同步到 `AGENTS.md`

---

## 15. 建议的下一步

针对当前仓库，建议下一步优先做这几件事：

1. 把你现有技能统一归档到 `skills/own/` 和 `skills/external/`
2. 为 Claude Code 准备 `.claude/skills/` 映射
3. 为通用 CLI 准备 `.agent/skills/` 映射
4. 使用 `openskills sync` 生成 `AGENTS.md`
5. 后续补充自动安装脚本，方便新电脑一键接入
