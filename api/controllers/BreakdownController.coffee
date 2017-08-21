#VoteController
_ = require 'lodash'
actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'

module.exports = 
  balance: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    sails.log.info "data: #{JSON.stringify data}"

    Model.find()
      .sum('Amount')
      .groupBy('vote','status')
      .then (results) ->
        res.ok results
      .catch res.serverError

  summary: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    sails.log.info "data: #{JSON.stringify data}"

    Model.find()
      .sum('Amount')
      .where( _.extend data, status: 'settled' )
      .then (results) ->
        res.ok results[0]
      .catch res.serverError


