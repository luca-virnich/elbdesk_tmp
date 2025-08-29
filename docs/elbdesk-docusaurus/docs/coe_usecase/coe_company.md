---
sidebar_position: 1
---

# Basic Customer Flow


## Introduction

The client "coe," currently relies on a legacy software called **Aramis**, developed by a company that no longer builds new products and is likely to shut down in the future. Aramis is poorly maintained, lacks scalability, and does not support future use cases. coe needs a modern, future-proof digital solution to manage their operations, as their entire company depends on this software. Our goal is to replace Aramis with a new system that is efficient, automatable, and adaptable to future needs.

### Goals
- Replace the legacy Aramis software with a modern, scalable solution.
- Improve efficiency by automating repetitive tasks and streamlining processes.
- Ensure the system is future-proof and can handle new use cases.
- Provide clear documentation of the process for developers and the customer.

---

## Current Process and Workflow

coe's operations involve producing **clichés** (stamps used by printing companies). The process starts with customer data (usually a PDF) and ends with physical clichés being produced and shipped. Below is a breakdown of the current workflow, including the stations and teams involved.

### 1. Customer Data Submission
- **Input**: The customer sends an email with a PDF containing the design to be printed (e.g., an image, measurements, colors).
- **Challenges**:
  - The PDF is often not cropped correctly and contains extraneous content (e.g., company logos, text).
  - The customer may send data without placing an order, requiring a quarantine system (see "Artwork Quarantine" below).


### 2. Data Entry Team
- **Role**: This team is responsible for preparing customer data for further processing:
  - **Location**: Station next to Media Operations.
  - **Process**:
    - Receives the customer's PDF via email.
    - Crops and cleans the PDF to isolate the design.
    - Uploads the cleaned PDF to the system for creating quarantine artworks.
    - The output is a PDF ready for the further processing.


### 3. Customer Management Team
- **Role**: Manages customer interactions and order processing:
  - **Responsibilities**:
    - Creating sales orders.
    - Managing customer communication.
    - Assigning tasks to the Media Operations Team based on sales orders.
  - **Process**:
    - Receives the processed PDF from the Data Entry Team.
    - Receives the *quarantine artwork* in the database for data received but not yet ordered.
    - Upon order confirmation, converts *quarantine artworks* to true artworks and attaches them to sales orders.
    - Manages the workflow of sales order items by assigning tasks.


### 4. Media Operations (Graphics Design Team)
- **Role**: The media operations team handles graphic design tasks, including:
  - Cropping and editing images.
  - Assigning colors (e.g., special colors like silver or gold that cannot be created with CMYK).
  - Recreating designs in Adobe Illustrator if the input (e.g., JPEG) is insufficient.
  - Creating proofs for the customer.
  - Preparing the step and repeat patterns.
- **Output**:
  - A PDF with correct measurements, colors, and embedded XMP metadata (e.g., color information, measurements).
  - The step and repeat patterns are ripped into **LEN files**, where each file represents one color layer for a cliché (e.g., a step and repeat with 5 colors results in 5 LEN files).

![Media Operations Output](/img/coe/ripping_len_files.png)
Image: Describes the process of ripping the step & repeat to .len files.   
GX1 would be a first order and GX2 a second one (Happens if the customer reorders cliches).

### 5. Production (Layout and Laser Engraving)
- **Role**: This station prepares the digital plate for production.
- **Process**:
  - Receives **LEN files** from Media Operations.
  - Arranges these **LEN files** on a digital plate (German: "Rohling").
  - Sends the digital plate to a laser machine, which engraves the design onto an actual plate.
  - Exposes the plate to UV light to harden the engraved areas.
  - Moves the plate to "Production 2".


### 6. Production 2
- **Role**: Finalizes the production of clichés from the engraved plate.
- **Process**:
  - Receives the engraved plate from Production.
  - Washes the plate to remove unhardened areas.
  - Hardens the plate under UV light again.
  - Cuts the plate into individual clichés.
  - Moves the clichés to the shipping station.

<!-- ![Production 2 Process](/img/production_2_process.png) -->

### 7. Packaging and Shipping
- **Process**:
  - The finished clichés are packaged and shipped to the customer or the printing company.
- **Variations**:
  - Some customers require a proof (e.g., a PDF or physical print) before production. This is handled as a sales order item (see "Sales Order Items" below).

<!-- ![Packaging and Shipping](/img/packaging_shipping.png) -->

---
