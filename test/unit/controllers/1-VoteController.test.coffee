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

    it 'Read Vote', ->
      request(sails.hooks.http.app)
      .get("/api/vote/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
 
    it 'Update Vote', ->
      request(sails.hooks.http.app)
      .put("/api/vote/#{id}")
      .send({ code: 'B70610088ME10', desc: 'HARDWARE-INHOUSE', type: 'procurement' })
      .set('Authorization',"Bearer #{token}")
      .expect 200

    it 'Delete Vote', ->
      request(sails.hooks.http.app)
      .del("/api/vote/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
