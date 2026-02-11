Linkly – Backend Documentation
Overview
The Linkly backend is a scalable URL shortening service built with Spring Boot.
It provides APIs to generate short URLs, redirect users to original URLs, and track basic analytics such as access count and timestamps.

The system is designed with performance, scalability, and clean architecture in mind.

Tech Stack
Java 17
Spring Boot
Spring Web
Spring Data JPA
MySQL / PostgreSQL
Maven

Why this stack:
Proven in high-throughput backend systems
Easy horizontal scaling
Production-ready ecosystem

High-Level Architecture
Client / Browser
        |
        | HTTP Request
        v
Spring Boot API
        |
        | JPA / Cache
        v
Database

Design Principles
Stateless REST APIs
Separation of concerns
Database-first consistency
Optimized read path for redirects
Extensible for analytics & auth

Project Structure
src/main/java/com/linkly
│
├── controller        # REST endpoints
├── service           # Business logic
├── repository        # Database access
├── model             # Entities
├── dto               # Request/Response DTOs
├── exception         # Global exception handling
├── config            # App & cache configs
└── util              # Utility classes (hashing, encoding)


This structure mirrors real-world Spring Boot services.
Core Features
URL Shortening
Accepts long URLs
Generates unique short codes
Persists mapping in database
URL Redirection
Resolves short code to original URL
Performs fast HTTP redirect
Handles invalid or expired links
Analytics (Basic)
Redirect count
Created timestamp
Last accessed timestamp

URL Shortening Strategy
Short Code Generation

Strategies used:
Base62 encoding
Random alphanumeric string
Collision check before persistence

Collision handling:
Retry generation
Enforced DB uniqueness constraint

Database Design
URL Entity
Key fields:
id
originalUrl
shortCode (unique)
createdAt
expiresAt (optional)
redirectCount
Indexes:
Unique index on shortCode
Index on createdAt for analytics

Redirection Flow
User accesses short URL
Backend extracts short code
Lookup in cache or database
Increment redirect count
Redirect to original URL

Optimized for:
High read traffic
Low latency

Exception Handling
Centralized global exception handling ensures consistent responses.

Handled cases:
Invalid short URL
Expired links
Malformed input URLs
Resource not found

API Design
RESTful endpoints
Proper HTTP status codes
DTO-based validation
Clean request/response models
