---
title: Agentic RAG / Knowledge Base — Overview
tags: [systems, agentic-rag]
---

# Agentic RAG / Knowledge Base

The Agentic RAG / Knowledge Base (RAG/KB) component is the **AI decision engine** of the Surplus application. It prepares and serves context-aware information to other components, primarily [[Systems/GoHighLevel/Overview|GoHighLevel]].

## Role

RAG/KB is supplied with:

- Manuals and protocols about Surplus Funds Acquisition
- Business operations documents
- Historical interaction data

When queried, it uses this knowledge to generate context-aware responses — such as the optimal message, channel, and timing for a given lead.

## Integration

RAG/KB exposes endpoints that GHL calls during campaign execution. It receives lead context from AND (via GHL) and returns actionable strategy.

It also receives interaction feedback from GHL after each outreach action, allowing it to refine its context on each lead over time.

See [[Systems/GoHighLevel/Integration|GoHighLevel Integration]] for the full data flow showing how RAG/KB fits into the pipeline.

---

*See also: [[Systems/Overview|Back to Systems Overview →]]*
