# Plan It Change 10 Back End API Readme

## Summary

  This readme was written for the Plan It Change back end API developed to support the [front end](https://github.com/abomb14c/PlanItChange-10) produced by Alan Charles. It lays out how the API functions and the different end points used to obtain information from the back end. There are a four different models that are utilized by this back end.

## Models

  *- Note: all models also include a created at and updated at datetime entry.*

### User Model

  The user model is made up of a user's first name, last name, email, password, city, state, and last login.

### Event Model

  The event model is made up of an event's city, state, information about that event, a start time,end time, owner, and event name.

### Post Model

  The post model is made up of a posts body.

### Comment Model

  The comment model is made up of a comments body.

## Routes

*-Note: most of these routes are restricted to only listen to the front end for requests*
*-Note: all routes should be preceeded by the URI /api/v1*

  The back end API for Plan It Change 10 is RESTful, therefore it includes index, show, update, create and destroy end points depending on the level of authorization of the user. Once a user has registered for an account, the front-end will request a JSON web token through the request route, and this will give it the authorization needed to reach the different routes that require authorization.

### User Routes

  - `/user_index?city=[city]&state=[state]` - This route will list all user's in the system for that particular city and state.
  - `/user_show/[user_id]` - This route will return the information for one user. A further iteration of this code will use friendly IDs.
  - `/user_update/[user_id]` - This route will allow the user to update their information.
    - Parameters accepted are - `email, first_name, last_name, city, state, password, password_confirmation`.
  - `/user_create` - This route will allow a user to create an account.
    - Parameters accepted are - `email, first_name, last_name, city, state, password, password_confirmation`.
  - `/user_delete/[user_id]` - This route will allow a user to delete their account.

### Event Routes

  - `/event_index?city=[city]&state=[state]` - This route will list all of the events for that particular city and state.
  - `/event_show/[event_id]` - This route will return the information for one event. A further iteration of this code will use friendly IDs.
  - `/event_update/[event_id]` - This route will allow the user who owns the event to update the event information.
    - Parameters accepted are - `city, state, information, start_time, end_time, event_name`.
  - `/event_create` - This route will allow a user to create an event.
    - Parameters accepted are - `city, state, information, start_time, end_time, event_name`.
  - `/event_delete/[event_id]` - This route will allow a user to delete an event, provided they are the owner.

### Post Routes

  - `/post_index?city=[city]&state=[state]` - This route will list all of the posts for that particular city and state.
  - `/post_show/[post_id]` - This route will return the information for that one post.
  - `/post_update/[post_id]` - This route will allow a user to update the information inside a post, provided they are the owner of that post.
    - Parameters accepted are - `body`.
  - `/post_create` - This route will allow a user to create a post.
    - Parameters accepted are - `body`.
  - `/post_delete/[post_id]` - This route will allow the user to delete a post, provided they are the owner.

### Comment Routes

  - `/comment_index/[post_id]` - This route will find all comments for a specific post.
  - `/comment_show/[comment_id]` - This route will find one specific comment by id.
  - `/comment_update/[comment_id]` - This route will allow a user to update the information inside a comment, provided they are the owner of the comment.
    - Parameters accepted are - `body`.
  - `/comment_create/[post_id]` - This route will allow a user to create a comment on post.
    - Parameters accepted are - `body`.
  - `/comment_delete/[comment_id]` - This route will allow a user to delete a comment, provided they are the owner of the comment.
