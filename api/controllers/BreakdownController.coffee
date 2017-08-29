#BreakdownController
_ = require 'lodash'
actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'
Promise = require 'bluebird'

module.exports = 
  allSummary: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    cond =
      "completedDate": { ">=": new Date('4/1/2017'), "<=": new Date('3/31/2018') }

    Model.find()
      .sum('Amount')
      .groupBy('status','vote')
      .where( cond )
      .then (results) ->
        sails.models.vote
          .find()
          .then (votes) ->
            _.each results, (r) ->
              r.vote = _.find(votes,  'id': "#{r.vote}") 

            res.ok results
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


