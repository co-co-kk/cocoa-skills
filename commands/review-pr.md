---
description: Claude Code 命令入口，调用 review-pr 技能
argument-hint: [pull-request 或 diff 上下文]
---

请调用 `skills/own/review-pr/SKILL.md` 对当前提供的 Pull Request、提交集合或代码差异进行结构化审阅。

要求：

- 优先基于实际改动内容给出结论
- 聚焦高价值问题、风险点与建议动作
- 输出保持结构化，避免泛泛而谈
