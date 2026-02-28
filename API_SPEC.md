# API Specification

## Users
- **GET /users**: Retrieve a list of users.
- **GET /users/{id}**: Retrieve user details by ID.
- **POST /users**: Create a new user.
- **PUT /users/{id}**: Update user information by ID.
- **DELETE /users/{id}**: Delete a user by ID.

## Teams
- **GET /teams**: Retrieve a list of teams.
- **GET /teams/{id}**: Retrieve team details by ID.
- **POST /teams**: Create a new team.
- **PUT /teams/{id}**: Update team information by ID.
- **DELETE /teams/{id}**: Delete a team by ID.

## Communities
- **GET /communities**: Retrieve a list of communities.
- **GET /communities/{id}**: Retrieve community details by ID.
- **POST /communities**: Create a new community.
- **PUT /communities/{id}**: Update community information by ID.
- **DELETE /communities/{id}**: Delete a community by ID.

## Friends
- **GET /friends**: Retrieve a list of friends for the current user.
- **POST /friends**: Add a friend by user ID.
- **DELETE /friends/{id}**: Remove a friend by user ID.

## Voice Chat Management
- **GET /voice**: Retrieve voice chat sessions.
- **POST /voice**: Create a new voice chat session.
- **DELETE /voice/{id}**: Delete a voice chat session by ID.

---

This document outlines the REST API endpoints available for managing users, teams, communities, friends, and voice chat sessions in the Discord clone application.