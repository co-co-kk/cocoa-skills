# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository status (2026-03-24)
- This repo currently contains only a minimal README and no source code or tooling configuration.
- Not present: package.json, lockfiles, tsconfig, ESLint/Prettier configs, Docker/Makefile, workspace/monorepo configs, or any source directories.

## Commands
No build/dev/lint/test commands are defined in this repository yet (no package manager or scripts detected).

When commands are added in the future, prefer running them via the project’s package manager scripts (e.g., `pnpm`, `yarn`, or `npm`) discovered in package.json. For single-test execution, check the configured test runner (e.g., Vitest/Jest/Playwright) and use its recommended pattern for filtering tests.

## Architecture overview
No code or configuration is present to summarize architecture. Once source is added, document the high-level modules and flows here (avoid enumerating every file; focus on major areas and how they interact).

## README highlights
- Title: `cocoa-skills`
- Description: “我的技能管理栈” (my skill management stack)

## What future Claude Code instances should do first
1) Re-scan the repo root for package manager files and scripts (package.json + lockfile) and any workspace config.
2) Identify the test runner (if any) to enable single-test runs.
3) Map the top-level source layout (e.g., `src/`, `apps/`, `packages/`, `skills/`) and update the Architecture overview section accordingly.

If you (the maintainer) want this file to include concrete commands and architecture details, add your tooling (package.json, configs, source) and this file can be updated to reflect the actual setup.