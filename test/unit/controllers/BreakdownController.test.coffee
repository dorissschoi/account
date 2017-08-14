env = require '../../env.coffee'
request = require 'supertest-as-promised'
oauth2 = require 'oauth2_client'
Promise = require 'bluebird'
MongoClient = require('mongodb').MongoClient

describe 'BreakdownController', ->

  describe 'CRUD', ->

    id = null
    voteTypeid = null
    voteid = null
    Typeid = null
    token = null

    before ->
      oauth2
        .token env.tokenUrl, env.client, env.user, env.scope
        .then (t) ->
          token = t

    it 'Create VoteType', ->
      request(sails.hooks.http.app)
      .post('/api/votetype')
      .send({ code: 'SOA' })
      .set('Authorization',"Bearer #{token}")
      .then (res)->
        voteTypeid = res.body.id

    it 'Create Vote', ->
      request(sails.hooks.http.app)
      .post('/api/vote')
      .send({ code: 'B77610088ME10', desc: 'HARDWARE INHOUSE' ,type:'SOA'})
      .set('Authorization',"Bearer #{token}")
      .expect 200
      .then (res)->
        voteid = res.body.id

    it 'Create Breakdown', ->
      request(sails.hooks.http.app)
      .post('/api/breakdown')
      .send({ group: 'e', desc: 'Server test', Amount: 200, vendor: 'ABC',status:'outstanding', vote:'B77610088ME10'})
      .set('Authorization',"Bearer #{token}")
      .expect 200
      .then (res)->
        id = res.body.id
        sails.log.info "id: #{id}"

    it 'Read Breakdown', ->
      request(sails.hooks.http.app)
      .get("/api/breakdown/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200
 
    it 'Update Breakdown', ->
      request(sails.hooks.http.app)
      .post('/api/breakdown')
      .send({ group: 'e', desc: 'Server', amount: 200, vendor: 'ABC',status:'processing', vote:'B77610088ME10'})
      .set('Authorization',"Bearer #{token}")
      .expect 200

    it 'Delete Breakdown', ->
      request(sails.hooks.http.app)
      .del("/api/breakdown/#{id}")
      .set('Authorization',"Bearer #{token}")
      .expect 200

    it 'Delete Vote', ->
      request(sails.hooks.http.app)
      .del("/api/vote/#{voteid}")
      .set('Authorization',"Bearer #{token}")

    it 'Delete VoteType', ->
      request(sails.hooks.http.app)
      .del("/api/votetype/#{voteTypeid}")
      .set('Authorization',"Bearer #{token}")
