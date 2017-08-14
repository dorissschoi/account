#VoteController
_ = require 'lodash'
actionUtil = require 'sails/lib/hooks/blueprints/actionUtil'

module.exports = 
  create: (req, res) ->
    Model = actionUtil.parseModel(req)
    data = actionUtil.parseValues(req)
    sails.log.info "data: #{JSON.stringify data}"

    Model.create(_.omit(data, 'type')) 
      .then (newInstance) ->
        sails.models.votetype.findOne code: data.type
          .then (votetypeInstance) ->
            votetypeInstance.votes.add newInstance
            votetypeInstance.save()
            res.ok(newInstance)
      .catch res.serverError
