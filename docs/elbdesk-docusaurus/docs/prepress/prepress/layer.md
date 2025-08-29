# Layer 
#### German: Ebene

A Layer represents a level in the artwork, defining specific characteristics and processing requirements for different elements of the design. Typically created by a template when creating an [Artwork SOI](../sales-order-items/artwork.md).

## Properties

### Core Attributes
- **ID** (`id`): Unique identifier for the layer
- **Layer Type** (`layerType`): Defines the layer's processing function (e.g., Punch, Varnish)
- **Layer Name** (`layerName`): Identifies the layer
- **Printable** (`printable`): Determines if the layer should be printed
- **Locked** (`locked`): Controls whether the layer can be edited

### Common Layer Types
- **Punch** (`Stanze`): For die-cutting specifications
- **Dimensioning** (`Bemassung`): For measurement and dimension markings
- **Varnish** (`Lack`): For varnish applications
- **Trapping**: For print overlap controls
- **Artwork**: For main design elements
- **White** (`Deckweiss`): For white underprint specifications

