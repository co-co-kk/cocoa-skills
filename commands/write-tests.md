---
description: Claude Code 命令入口，调用 write-tests 技能
argument-hint: [需求、文件、函数或 diff 上下文]
---

请调用 `skills/own/write-tests/SKILL.md`，围绕当前上下文补充测试设计或测试代码建议。

要求：

- 优先覆盖核心路径、边界条件与回归风险
- 明确测试层级与测试目标
- 如果上下文不足，要指出缺失信息
