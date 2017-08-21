# account

Web App to maintain account info

Web Service API
---------------

* attributes
  see [api/models/*.coffee]

* api
```
get /api/votetype - list votetype created 
get /api/vote - list vote created 
get /api/breakdown - list breakdown created 
get /api/user - list user created 
GET /api/breakdown/vote/:vote/summary - list specified vote settled summary
GET /api/breakdown/summary - list vote summary by status

post /api/votetype - create votetype with specified attribute values
post /api/vote - create vote with votetype and attribute values
post /api/breakdown - create breakdown with vote with and attribute values
post /api/user - create user with specified attribute values

put /api/votetype/:id - update attribute with specified id
put /api/vote/:id - update attribute with specified id
put /api/breakdown/:id - update attribute with specified id
put /api/user/:id - update attribute with specified id

delete /api/votetype/:id - destroy with specified id
delete /api/vote/:id - destroy with specified id
delete /api/breakdown/:id - destroy with specified id
delete /api/user/:id - destroy with specified id
```

Configuration
-------------
* Configured by environment variables in .env
