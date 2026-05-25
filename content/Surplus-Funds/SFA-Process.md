---
title: Surplus Funds Acquisition Process
tags: [surplus-funds]
---

# Surplus Funds Acquisition Process

Surplus Funds Acquisition (SFA) is performed by agents who locate property owners with unclaimed surplus funds, inform them, and handle retrieval for a commission. There are 3 phases: **Client Acquisition**, **Closing**, and **Fulfillment**.

```mermaid
graph TD
    subgraph Phase1 [Phase 1: Client Acquisition]
        CW[(County Websites)] --> AD[/Auction Details/]
        AD --> ST[Skip Tracing]
        ST --> CD[/Extracted: Full Name, Contact, Surplus Amount/]
        CD --> OC[Outbound / Cold Calling]
        OC --> Reached{Client Contacted?}
        Reached -- No --> CR[Contact Relatives]
        CR --> Reached
        Reached -- Yes --> EndP1([Phase 1 Complete])
    end

    subgraph Phase2 [Phase 2: Closing]
        EndP1 --> IC[Inform Client of Surplus Funds]
        IC --> HS[Address Skepticism — Explain No Catch]
        HS --> Explain[Explain Legal Process Ahead]
        Explain --> Sign{Agreement Signed?}
        Sign -- No --> IC
        Sign -- Yes --> EndP2([Phase 2 Complete])
    end

    subgraph Phase3 [Phase 3: Fulfillment]
        EndP2 --> LP{{Legal Processes Commenced}}
        LP --> Docs[/Attorneys Request Documents/]
        Docs --> Updates[/Client Requests Updates/]
        Updates --> Handled{Legal Process Complete?}
        Handled -- No --> LP
        Handled -- Yes --> Money[/Money Handed to Client/]
        Money --> Cut[SFA Agent Takes Contractual Cut]
    end

    Cut --> Repeat([Rinse and Repeat])
    Repeat -.-> CW
```

## Phase 1: Client Acquisition

Most auction data is publicly available on county websites. Skip tracing extracts the property owner's full name, contact details, surplus amount, and other information. The SFA agent then reaches out via all possible channels. If direct contact fails, they attempt to reach the owner through relatives.

## Phase 2: Closing

The agent informs the client of their owed funds and aims to get them to sign a retrieval agreement. The key challenge is trust — from the client's perspective, "free money" sounds suspicious. There is no catch: the legal complexity is real, and the agent handles it for a commission (typically 30%).

**Example payout:** $1,500 surplus × 30% commission = $450 to agent, $1,050 to client.

## Phase 3: Fulfillment

Attorneys handle the formal legal process: document requests, county submissions, and months of processing time. Once approved, funds are released and split per the signed agreement.

---

## Traditional vs. Metawatt Pipeline

**The bottleneck:** Traditional SFA is strictly manual and 1-to-1. Every interaction requires a human staff member. Capacity is hard-capped by headcount.

```mermaid
sequenceDiagram
    autonumber
    participant Staff as Human Staff Member
    participant Client as Single Local Client
    participant Closer as Human Closing Agent

    rect rgb(255, 235, 235)
    Note over Staff, Closer: THE BOTTLENECK — Traditional Pipeline
    Staff->>Client: Manually dials and prospects
    Client-->>Staff: Responds (1-to-1 interaction)
    Staff->>Staff: Manual CRM data entry & follow-ups
    Staff->>Closer: Transfers limited lead information
    Closer->>Client: Manual negotiation & closing
    Closer->>Closer: Manual document preparation
    Note over Staff, Closer: Strictly linear. Capacity hard-capped by headcount.
    end
```

**The Metawatt solution:** AI tools handle top-of-funnel outreach at scale across multiple states simultaneously. Warm leads are handed off to human closers with full context. Legal teams handle fulfillment assisted by AI-drafted documents.

```mermaid
sequenceDiagram
    autonumber
    participant App as Metawatt App
    participant Nation as Multi-State Clients
    participant Closer as Human Closing Agent
    participant Legal as Human Legal Team

    rect rgb(235, 245, 255)
    Note over App, Legal: THE HYBRID SOLUTION — Metawatt Pipeline
    par Simultaneous Multi-State Outreach
        App->>Nation: Retell AI initiates voice agents
    and
        App->>Nation: DropCowboy sends ringless voicemails
    and
        App->>Nation: GoHighLevel manages campaigns
    end
    Nation-->>App: Leads respond & are pre-qualified at scale
    Note over App, Closer: Top-of-Funnel Hand-off
    App->>Closer: Routes warm leads & full conversation context
    Closer->>Nation: Negotiates and secures the close
    Note over App, Legal: Bottom-of-Funnel Execution
    App->>Legal: Summarizes files & auto-drafts legal documents
    Legal->>Nation: Reviews and executes final legal processes
    Note over App, Legal: Exponential, multi-state scaling with expert human finishing.
    end
```

---

*See also: [[Systems/Overview|The technical system that powers this →]]*
