 🛍️ E-commerce Database Design

## 📚 Overview

This project presents a comprehensive database design for an e-commerce platform. It includes:

- An Entity-Relationship Diagram (ERD) outlining the database structure.
- A SQL script (`ecommerce.sql`) to create the database schema.

## 🎯 Objective

To design a robust and scalable database schema that supports:

- Product management with variations (size, color).
- Categorization of products.
- Brand association.
- Inventory tracking.
- Product attributes and metadata.

## 🗃️ Database Schema

The database consists of the following tables:

- `brand`: Stores brand information.
- `product_category`: Categorizes products.
- `product`: Contains product details.
- `color`: Lists available colors.
- `size_category`: Groups size options.
- `size_option`: Specifies size values.
- `product_item`: Represents specific product variations.
- `product_image`: Stores images for product items.
- `product_variation`: Links products to their variations.
- `attribute_category`: Groups product attributes.
- `attribute_type`: Defines types of attributes.
- `product_attribute`: Stores custom attributes for products.
