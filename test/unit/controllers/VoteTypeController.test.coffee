env = require '../../env.coffee'
request = require 'supertest-as-promised'
oauth2 = require 'oauth2_client'
Promise = require 'bluebird'
MongoClient = require('mongodb').MongoClient

describe 'VoteTypeController', ->

  describe 'CRUD', ->

    id = null
    token = null

    before ->
      oauth2
        .token env.tokenUrl, env.client, env.user, env.scope
        .then (t) ->
          token = t

    it 'Create VoteType', ->
      request(sails.hooks.http.app)
      .post('/api/votetype')
      .send({ code: 'DE' })
      .set('Authorization',"Bearer #{token}")
      .expect 201
      .then (res)->
        id = res.body.id

    it 'Read VoteType', ->
      request(sails.hooks.http.app)
      .get("/api/votetype/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
 
    it 'Update VoteType', ->
      request(sails.hooks.http.app)
      .put("/api/votetype/#{id}")
      .send({ code: 'proj' })
      .set('Authorization',"Bearer #{token}")
      .expect 200

    it 'Delete VoteType', ->
      request(sails.hooks.http.app)
      .del("/api/votetype/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
