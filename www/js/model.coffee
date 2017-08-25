env = require './env.coffee'
require 'PageableAR'
		
angular.module 'starter.model', ['PageableAR']
	
  .factory 'model', (pageableAR, $filter, $log, $state) ->

    class User extends pageableAR.Model
      $urlRoot: "org/api/users/"
      @me: ->
        (new User(username: 'me/')).$fetch()	
		
    # Account model
    class VoteType extends pageableAR.Model
      $urlRoot: "api/votetype/"

    class VoteTypeList extends pageableAR.PageableCollection
      model: VoteType

      $urlRoot: "api/votetype/"    

    class Vote extends pageableAR.Model
      $urlRoot: "api/vote/"

    class VoteList extends pageableAR.PageableCollection
      model: Vote

      $urlRoot: "api/vote/"    

    class Summary extends pageableAR.Model
      model: Breakdown 

      $urlRoot: "api/breakdown/vote/:vote/summary"    

    class Breakdown extends pageableAR.Model
      $urlRoot: "api/breakdown/"

    class BreakdownList extends pageableAR.PageableCollection
      model: Breakdown

      $urlRoot: "api/breakdown/"

    class SummaryList extends pageableAR.Collection
      model: Breakdown

      $urlRoot: "api/breakdown/summary"

      $fetch: (opts = {}) ->
        return new Promise (fulfill, reject) =>
          @$sync('read', @, opts)
            .then (res) =>
              data = @$parse(res.data, opts)
              if _.isArray data
                @.models = data
                fulfill @
              else
                reject 'Not a valid response type'
            .catch reject

  
    VoteType: VoteType
    VoteTypeList: VoteTypeList
    Vote: Vote
    VoteList: VoteList 	
    Breakdown: Breakdown
    BreakdownList: BreakdownList
    Summary: Summary
    SummaryList: SummaryList
    User: User	
