---
title: Surplus Funds Overview
tags: [surplus-funds]
---

# Surplus Funds

Surplus Funds is a Metawatt project developed to help individuals in the US recover surplus funds from counties.

## What Are Surplus Funds?

When individuals fail to pay their taxes, their property gets auctioned off by their county to cover the cost. The final bid may exceed the property's actual value. The county only takes what is owed — the remaining excess sits in the county treasury. That excess is **surplus funds**, and it is legally owed back to the original property owner.

**Example:** Property valued at $2,500 sells at auction for $4,000. The county takes $2,500. The remaining $1,500 is surplus funds owed to the former owner.

```mermaid
graph TD
    classDef action fill:#f8f9fa,stroke:#6c757d,stroke-width:2px,color:black;
    classDef county fill:#f8d7da,stroke:#dc3545,stroke-width:2px,color:black;
    classDef money fill:#d4edda,stroke:#28a745,stroke-width:2px,color:black;
    classDef surplus fill:#fff3cd,stroke:#ffc107,stroke-width:3px,color:black;
    classDef owner fill:#cce5ff,stroke:#007bff,stroke-width:2px,color:black;

    A[Property Owner]:::owner -->|"Fails to pay taxes"| B[County Auctions Property]:::action
    B -->|"Auction concludes"| C{Final Bid: $4,000}:::money
    C -->|"Covers taxes & costs"| D[County takes what is owed: $2,500]:::county
    C ==>|"Excess from bidding"| E((Surplus Funds: $1,500)):::surplus
    E -->|"Sits safely in"| F[County Treasury]:::county
    E -.->|"Legally owed back to"| A
```

## The Problem

Counties keep surplus funds safely but make minimal effort to notify property owners. Some send a letter to the property address, but most individuals are unaware that surplus funds even exist. Compounding this: local laws in many counties allow surplus funds to be absorbed into government accounts after a set period of inactivity.

```mermaid
sequenceDiagram
    autonumber
    participant Gov as Local Government
    participant County as County Treasury
    participant Owner as Property Owner

    rect rgb(255, 235, 235)
    Note over Gov, Owner: THE TRAP — Status Quo Problem
    County->>County: Holds funds safely ($1,500)
    County-.->Owner: Sends minimal, ineffective notice (e.g., letter to old address)
    Note over Owner: Unaware of surplus funds concept. Does not check for them.
    opt If extensive time passes (per local law)
        County->>Gov: Funds legally absorbed into government accounts
    end
    end
```

Retrieving surplus funds is not as simple as walking into a county office. It requires going through a legal process with an attorney — paperwork and many months of processing before funds are released.

---

*Next: [[Surplus-Funds/SFA-Process|How Surplus Funds Acquisition works →]]*  
*See also: [[Systems/Overview|The technical system that automates this process →]]*
