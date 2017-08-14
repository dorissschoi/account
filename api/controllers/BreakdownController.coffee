#VoteController
_ = require 'lodash'
actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'

module.exports = 
  create: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    sails.log.info "data: #{JSON.stringify data}"

    Model.create(_.omit(data, 'vote'))
      .then (newInstance) ->
        sails.models.vote.findOne code: data.vote
          .then (voteInstance) ->
            voteInstance.details.add newInstance
            voteInstance.save()
        
            res.ok(newInstance)
      .catch res.serverError
