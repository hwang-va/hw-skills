---
name: c4-deployment-level2
description: "Trigger: /spec:c4-deployment-level2 or deployment, hosting, environment, region request. Outcome: ASCII C4 Deployment diagram from spec and C4 Level 2, inline."
---
# C4-Deployment-Level2
Goal: Render spec as C4 Deployment diagram (Simon Brown, c4model.com), ASCII, inline; every container mapped to a node (arc42 §7).
Target: Descriptive spec user points at; infer from full chat context. C4 Level 2 output, if present, is container source; else infer containers from spec, tag Inferred.
Scope: Environments: production drawn; each other environment one delta line. Hosting: cloud, on-prem, vendor-hosted, or customer-hosted; region. Deployment Nodes: nested, each with technology. Infrastructure Nodes: load balancer, gateway, DNS, firewall. Container Instances: every container on one node, replica count. Model and Agent Placement: inference, agent runtime, sandbox, MCP servers. Relationships: protocol and port, network zone. Residency: region per data store. Notes: assumptions.
Reference: `${CLAUDE_PLUGIN_ROOT}/references/spec-sections.md`: Levels plus `## C4`, `### Level 2 Deployment`; if absent, standard box-drawing glyphs.
Output: Element list, divider, diagram, divider, gaps.

## Process
1. Extract: From spec and C4 Level 2, list each Scope element. Tag each Verified, Inferred, or Unknown.
2. Map: Every container to one node. No hosting fact = node `Unknown`; never invent cloud, region, or product.
3. Render: ASCII per legend. Production only. Nodes nest outer to inner: hosting, region, cluster or service. Every link labelled `protocol:port / zone`.
4. Deltas: One line per other environment: what differs from production.
5. Gaps: List Unknown. One question each.

Requirements:
1. Every C4 Level 2 container appears once, or is marked not deployed; every data store names region or `Unknown`.
2. Fits one screen: ≤ 12 nodes. More = split by hosting boundary.
