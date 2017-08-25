#BreakdownController
_ = require 'lodash'
actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'
Promise = require 'promise'

getRecord = (rst) ->
  sails.models.vote
    .findOne({id: rst.vote})
    .then (r) ->
      rst.vote = r
      return rst
    .catch (err) ->
      sails.log.error err

module.exports = 
  allSummary: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    cond =
      "completedDate": { ">=": new Date('4/1/2017'), "<=": new Date('3/31/2018') }
    sails.log.info "data: #{JSON.stringify cond}"

    Model.find()
      .sum('Amount')
      .groupBy('type','status','vote')
      .where( cond )
      .then (results) ->
        sails.log.info "results: #{JSON.stringify results}"
        Promise.all _.map results, getRecord
          .then (rec) ->
            r =
              count: results.length
              results: rec
            sails.log.info "r: #{JSON.stringify rec}"
            res.ok r
      .catch res.serverError

  summary: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    cond =
      status: 'settled'
      "completedDate": { ">=": new Date('4/1/2017'), "<=": new Date('3/31/2018') }
    _.extend data, cond
    sails.log.info "data: #{JSON.stringify data}"

    Model.find()
      .sum('Amount')
      .where( data )
      .then (results) ->
        res.ok results[0]
      .catch res.serverError


