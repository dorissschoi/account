env = require '../../env.coffee'
request = require 'supertest-as-promised'
oauth2 = require 'oauth2_client'
Promise = require 'bluebird'
MongoClient = require('mongodb').MongoClient

describe 'VoteController', ->

  describe 'CRUD', ->

    id = null
    Typeid = null
    token = null

    before ->
      oauth2
        .token env.tokenUrl, env.client, env.user, env.scope
        .then (t) ->
          token = t

    it 'Create Vote', ->
      request(sails.hooks.http.app)
      .post('/api/vote')
      .send({ code: 'B70610088ME10', desc: 'HARDWARE INHOUSE', type: 'procurement' })
      .set('Authorization',"Bearer #{token}")
      .expect 201
      .then (res)->
        id = res.body.id

    it 'Read VoteType', ->
      request(sails.hooks.http.app)
      .get("/api/vote/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
 
    it 'Delete VoteType', ->
      request(sails.hooks.http.app)
      .del("/api/vote/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200


    it 'Create VoteType for Vote', ->
      request(sails.hooks.http.app)
      .post('/api/votetype')
      .send({ code: 'SOA' })
      .set('Authorization',"Bearer #{token}")
      .expect 201
      .then (res)->
        Typeid = res.body.id

    it 'Create Vote for VoteType', ->
      request(sails.hooks.http.app)
      .post('/api/vote')
      .send({ code: 'B70610088ME10', desc: 'SOFTWARE INHOUSE', type: 'procurement' })
      .set('Authorization',"Bearer #{token}")
      .expect 201
      .then (res)->
        id = res.body.id

    it 'Create VoteType and Vote assoc', ->
      request(sails.hooks.http.app)
      .post("/api/votetype/#{Typeid}/votes/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
      .then (res)->
        id = res.body.id
