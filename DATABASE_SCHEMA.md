# PostgreSQL Database Schema

This document provides the complete PostgreSQL database schema for the Discord clone application, including details about data types and constraints.

## Tables

### Users
- **id**: SERIAL PRIMARY KEY  
- **username**: VARCHAR(50) NOT NULL UNIQUE  
- **email**: VARCHAR(100) NOT NULL UNIQUE  
- **password**: VARCHAR(255) NOT NULL  
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

### Teams
- **id**: SERIAL PRIMARY KEY  
- **name**: VARCHAR(100) NOT NULL UNIQUE  
- **owner_id**: INTEGER REFERENCES Users(id) ON DELETE CASCADE  
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

### Communities
- **id**: SERIAL PRIMARY KEY  
- **name**: VARCHAR(100) NOT NULL UNIQUE  
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

### Friends
- **user_id**: INTEGER REFERENCES Users(id) ON DELETE CASCADE,  
- **friend_id**: INTEGER REFERENCES Users(id) ON DELETE CASCADE,  
- **status**: VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'accepted', 'blocked')),  
- PRIMARY KEY (user_id, friend_id)

### VoiceSessions
- **id**: SERIAL PRIMARY KEY  
- **team_id**: INTEGER REFERENCES Teams(id) ON DELETE CASCADE  
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

### Invites
- **id**: SERIAL PRIMARY KEY  
- **team_id**: INTEGER REFERENCES Teams(id) ON DELETE CASCADE  
- **user_id**: INTEGER REFERENCES Users(id) ON DELETE CASCADE  
- **invite_code**: VARCHAR(50) NOT NULL UNIQUE  
- **expires_at**: TIMESTAMP NOT NULL  
- **created_at**: TIMESTAMP DEFAULT CURRENT_TIMESTAMP

### Relationships
- Users can belong to multiple Teams.  
- Users can be Friends with each other through the Friends table.  
- Each Team can have multiple VoiceSessions.  
- Teams can be invited to by Users through the Invites table.  

## Constraints
- All foreign keys must have cascading delete options where necessary.  
- Unique constraints are enforced on fields that should remain unique across the database.

This schema is designed to ensure data integrity and relationships while accommodating the application's functionality.