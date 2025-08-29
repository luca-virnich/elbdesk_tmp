# Artwork SOI

An Artwork Sales Order Item represents an artwork SOI within a sales order.

## Purpose

Artwork items help manage the workflow of:
- Artwork Creation
- Artwork Editing

## Key Components

### Basic Information
- **Item Name & Description**: Identifies and describes the SOI
- **Status**: Tracks the current state of the SOI (e.g., draft, in progress, ready for review)
- **Work Instructions**: Special notes or requirements for the SOI

### Time Planning
- **Planned Time**: Estimated time needed for completion (typically tracked in 6-minute intervals)
- **Planned Date**: Target completion date for the artwork

### Print Specifications
- **Customer Color Specifications**: Customer-specific color requirements and preferences
- **Layers**: Organization of artwork elements in separate layers
- **Trapping**: Settings for print preparation to prevent gaps or overlays between colors
- **Bleed**: Extra margin around the artwork for trimming

### Relations
- **Assigned User**: The employee responsible for the SOI
- **Sales Order**: The parent order this artwork belongs to


## Model Structure

The `SoiArtworkDTO` contains the following fields:

### General Fields
- `itemName`: String - Name of the artwork item
- `description`: String - Detailed description
- `status`: SalesOrderItemStatus - Current status
- `workInstructions`: String? - Additional processing instructions
- `plannedTime`: int? - Estimated time in minutes
- `plannedDate`: DateTime? - Target completion date

### Print Specifications
- `customerColorSpecs`: List\<CustomerColorSpecDTO\>? - Color requirements - (Rasterangaben)
- `layers`: List\<LayerDTO\>? - Artwork layers - (Ebenen)
- `trapping`: TrappingDTO? - Trapping specifications
- `bleed`: double? - Bleed margin in millimeters - (Anschnitt)

### Relations
- `assignedUser`: AppUserDTO? - Responsible user
- `salesOrder`: SalesOrderDTO? - Parent sales order

### Metadata
- `createdAt`: DateTime - Creation timestamp
- `createdBy`: UserInfo? - Creating user
- `lastModifiedAt`: DateTime? - Last modification time
- `lastModifiedBy`: UserInfo? - Last modifying user
- `isDraft`: bool - Draft status
- `editedBy`: UserInfo? - Currently editing user
- `editedAt`: DateTime? - Current editing timestamp
- `editSession`: String? - Editing session ID
- `deletedBy`: UserInfo? - Deleting user
- `deletedAt`: DateTime? - Deletion timestamp