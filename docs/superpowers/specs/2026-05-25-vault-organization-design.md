# Vault Organization Design — MetaWatt Internship Guidebook

**Date:** 2026-05-25  
**Audience:** Interns (published Quartz site) + internal team reference  
**Source:** `content/MetaWatt Internship Guidebook.md` (fully decomposed — original file removed)

---

## 1. Objectives

- Decompose the monolithic guidebook into logical, navigable notes
- Prioritize detailed, diagram-rich explanations of the 4 system components
- Produce proper Mermaid diagrams (source has them mangled as image embeds)
- Structure works as both an Obsidian vault and a Quartz v4 published site

---

## 2. Folder Structure

```
content/
├── index.md
├── Introduction.md
├── Essentials/
│   ├── Personnel.md
│   └── Communications.md
├── Surplus-Funds/
│   ├── Overview.md
│   └── SFA-Process.md
├── Systems/
│   ├── Overview.md
│   ├── Web-Scraping/
│   │   ├── Overview.md
│   │   └── Integration.md
│   ├── API-Database/
│   │   ├── Overview.md
│   │   └── Integration.md
│   ├── GoHighLevel/
│   │   ├── Overview.md
│   │   └── Integration.md
│   └── Agentic-RAG/
│       └── Overview.md
├── Engineering/
│   ├── Git-Guidelines.md
│   ├── Branching-Strategy.md
│   └── Agentic-Coding.md
└── Operations/
    ├── Scrum-Handbook.md
    ├── Daily-Schedule.md
    └── Calendar.md
```

Total: 19 notes + index.

---

## 3. Frontmatter Convention

Every note uses:

```yaml
---
title: "Human-readable title"
tags: [tag1, tag2]
---
```

Tag taxonomy:
- `essentials` — Personnel, Communications
- `surplus-funds` — business domain notes
- `systems` — all Systems/ notes
- `web-scraping`, `api-database`, `gohighlevel`, `agentic-rag` — per-component tags
- `engineering` — Git, Branching, Agentic Coding
- `operations` — Scrum, Schedule, Calendar

---

## 4. Linking Strategy

- `index.md` → links all top-level sections
- `Systems/Overview.md` → links all 4 component Overview notes (hub)
- Each `Integration.md` → links back to both components it bridges
- `Operations/Scrum-Handbook.md` → links `Essentials/Personnel.md` (team structure references)
- `Surplus-Funds/SFA-Process.md` → links `Systems/Overview.md` (where automation enters)
- All links use `[[WikiLink]]` format for Obsidian + Quartz compatibility

---

## 5. Mermaid Diagram Plan

| Note | Diagrams |
|------|----------|
| `Surplus-Funds/Overview.md` | Surplus funds generation flowchart · Post-auction sequence diagram |
| `Surplus-Funds/SFA-Process.md` | 3-phase acquisition flowchart · Traditional pipeline sequence · Metawatt hybrid pipeline sequence |
| `Systems/Overview.md` | 4-component high-level architecture (graph TD) |
| `Systems/Web-Scraping/Overview.md` | Scaling challenge flowchart · Maintenance challenge flowchart |
| `Systems/Web-Scraping/Integration.md` | WS → AND → App data flow (flowchart LR) |
| `Systems/API-Database/Overview.md` | AND responsibilities diagram |
| `Systems/API-Database/Integration.md` | AND as central glue: all 4 components (flowchart LR) |
| `Systems/GoHighLevel/Overview.md` | GHL execution layer overview |
| `Systems/GoHighLevel/Integration.md` | Full GHL ↔ AND ↔ RAG/KB ↔ Execution layer data flow (flowchart TB) |
| `Engineering/Git-Guidelines.md` | Ticket lifecycle state diagram (stateDiagram-v2) |
| `Engineering/Branching-Strategy.md` | Branch flow: test→feature→dev→staging→prod (graph TD) |
| `Operations/Scrum-Handbook.md` | Org structure · Sprint lifecycle phases |

All diagrams written as native Mermaid code blocks, not image embeds.

---

## 6. Notes on Source Material

- `Systems/Agentic-RAG/Overview.md` will be thin — source material has minimal detail beyond the component's role
- User Flow Diagram placeholder in source (`/ to do`) → skipped entirely, no stub note
- Calendar section preserved as-is in `Operations/Calendar.md`
- Scrum Handbook is large — kept as single note (already well-structured with internal headings)
- Agentic Coding Guidelines is large — kept as single note (4 workflows + appendices are cohesive)
