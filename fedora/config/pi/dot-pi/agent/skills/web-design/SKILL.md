---
name: web-design
description: Design and compare 2–3 interactive web UI alternatives for a feature in the current repository. Use when asked to explore web application layouts, visual direction, or UX before selecting and integrating a design.
---

# Web design exploration

Invoke with `/skill:web-design <feature or path to design brief>` from the application repository. The user's request or referenced brief is the source of truth. This is a staged review: **do not integrate a winning design until the user picks one**.

## 1. Understand and clarify

- Read the brief (if supplied), the existing UI, routes, design system, app commands, and relevant project instructions. Preserve the application's framework and conventions. Do not invent an unrelated stack or replace working functionality.
- Summarize the goal, audience, desired feel, constraints, and what is unknown. Ask at most 3–5 high-value questions in one batch when answers would materially change the design (e.g. primary task, brand constraints, accessibility, required mobile behavior). Offer sensible defaults; don't block on minor choices. Wait for answers before building if the uncertainties are significant.
- Agree on the feature/screen boundary. Prefer realistic copy and states over lorem ipsum. Include keyboard access, readable contrast, responsiveness, and loading/empty/error states where relevant.

## 2. Produce alternatives

- Briefly describe 2–3 genuinely different directions with their trade-offs before or while building. Differentiate hierarchy, interaction, and visual language, not only colors. Explain any assumptions.
- Implement *working* alternatives using the existing app and its dev server, in isolated preview routes or components that can be opened side by side in separate browser tabs. Avoid replacing production routes, editing the lockfile, or adding dependencies just for previews. Keep changes confined to the relevant feature and preview code; identify any necessary shared changes. If isolation is not feasible, explain why and get approval before modifying a production view.
- Run the project's available checks if practical. Start or use its local server only after identifying the documented command and port. Never assume a public URL or expose a dev server beyond localhost without asking. Report the exact localhost URL for each alternative and the command needed to run the server. Leave the previews available for the user to click through; don't clean them up yet.

## 3. Review visually (optional, recommended)

- Screenshots are evidence, not a substitute for runnable previews. Use Pi's user-level `playwright` MCP server (deferred exposure: discover `mcp__playwright` tools with `tool_search` or `codemode`). Navigate to each localhost preview, exercise its primary interaction, and take comparable desktop (about 1440×900) and mobile (about 390×844) screenshots. Use the browser resize tool or separate browser contexts as needed. Inspect the resulting images and browser console; check overflow, hierarchy, contrast, and broken states, then iterate. Share the preview URLs and screenshots (or their saved paths, if the MCP tool saves them).
- Playwright and its MCP server are installed with global mise tools, **not** in the application. Never add browser dependencies, change package.json or lockfiles, or install packages in the application for screenshots. If the MCP connection or browser is unavailable, report the issue and give manual browser test instructions instead. Do not silently switch to `npx` or install dependencies.
- Give a concise comparison of strengths, weaknesses, and accessibility/responsive risks, then **ask the user to choose** or request another iteration.

## 4. After selection

- Once the user chooses, refine and integrate only that design into the actual feature. Confirm before deleting previews if they contain work the user may want to keep. Remove rejected preview routes/components after approval, run available checks, and report the final local URL, relevant changed files, and any remaining limitations. Do not commit unless asked.
