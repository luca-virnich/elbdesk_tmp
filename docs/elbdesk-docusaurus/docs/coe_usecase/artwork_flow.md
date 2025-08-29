---
sidebar_position: 2
---

# New Artwork Flow

This document outlines the new workflow for managing artworks from submission through to production, focusing on the integration of the quarantine system and the roles of different teams.

## Introduction

Efficient artwork management is crucial for COE to streamline the process from customer data submission to the final production of clichés. The new system introduces a quarantine phase for artworks to ensure that only ordered artworks enter the production system.

## Artwork Lifecycle

### 1. Artwork Quarantine (Dateneingang / Data Entry)
- **Role**: Data Entry Team
- **Process**:
  - **Input**: Customer's PDF via email.
  - **Action**: The PDF is cropped, cleaned, prepared and afterwards submitted via the "Dateneingang" App.
  - **Output**: An **Artwork Quarantine** entry is created in the database and the artwork pdf is placed in a specific folder. This quarantine artwork holds the data and the path to the artwork, until an actual order is placed.
  - **Purpose**: To manage customer data submissions and have a clearly distinguished difference of artworks that have not yet resulted in an actual order.

<!-- ![Artwork Quarantine Process](/img/artwork_quarantine_process.png) -->

### 2. Order Management (Auftrags Vorbereitung - AV)

- **Role**: Customer and Order Management Team

- **Management and Usage of Quarantine Artworks:**
  - **Input**: Quarantine artworks visible in the system.
  - **Action**:
    - Review the quarantine artworks for any new or updated orders.
    - When a customer confirms an order, the team converts the quarantine artwork into a true **Artwork** attached to a **Sales Order**.
  - **Output**: A SalesOrder with associated Artworks.

<!-- ![Order Management Process](/img/order_management_process.png) -->

- **Task Assignment:**
  - **Input**: SalesOrder with Artworks.
  - **Action**: Usually assigns tasks to the Media Operations (MOP) team based on the sales order:
    - **Prepare Artwork**: If the artwork needs to be created or updated (e.g., logo or color changes).
    - **Prepare Step & Repeat**: Arranging multiple clichés on a digital layout.
  - **Output**: SalesOrderItems assigned to colleagues that are associated with the previously created SalesOrder.

<!-- ![Task Assignment](/img/task_assignment.png) -->

### 3. Media Operations (MOP)
- **Role**: Graphics Design Team
- **Process**:
  - **Input**: Assigned tasks (Ex.: Prepare Artwork, Prepare Step & Repeat etc.).
  - **Action**:
    - **Prepare Artwork**: Edit, crop, and finalize the artwork.
    - **Prepare Step & Repeat**: Create the Step & Repeat layout and rip the artwork into **LEN files**.
  - **Output**: 
    - Prepare Artwork: A finalized PDF ready for production or proofing.
    - Prepare Step & Repeat: LEN files ready for production.

---

## Summary

The new artwork flow ensures that confirmed orders and pre provided artworks are distinguishable, reducing waste and improving efficiency. The quarantine system acts as a buffer, allowing for better management of customer data and orders. By clearly defining roles and automating where possible, this workflow aims to enhance productivity and accuracy in COE's operations.

---