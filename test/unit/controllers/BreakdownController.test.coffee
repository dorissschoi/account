env = require '../../env.coffee'
request = require 'supertest-as-promised'
oauth2 = require 'oauth2_client'
Promise = require 'bluebird'
MongoClient = require('mongodb').MongoClient

describe 'BreakdownController', ->

  describe 'CRUD', ->

    id = null
    Typeid = null
    token = null

    before ->
      oauth2
        .token env.tokenUrl, env.client, env.user, env.scope
        .then (t) ->
          token = t

    it 'Create Breakdown', ->
      request(sails.hooks.http.app)
      .post('/api/breakdown')
      .send({ code: 'eOGCIO', desc: 'Server test', amount: 200, vendor: 'ABC',status:'outstanding'})
      .set('Authorization',"Bearer #{token}")
      .expect 201
      .then (res)->
        id = res.body.id

    it 'Read Breakdown', ->
      request(sails.hooks.http.app)
      .get("/api/breakdown/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
 
    it 'Update Breakdown', ->
      request(sails.hooks.http.app)
      .post('/api/breakdown')
      .send({ code: 'eOGCIO', desc: 'Server', amount: 200, vendor: 'ABC',status:'processing'})
      .set('Authorization',"Bearer #{token}")
      .expect 201

    it 'Delete Breakdown', ->
      request(sails.hooks.http.app)
      .del("/api/breakdown/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200


