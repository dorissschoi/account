env = require './env.coffee'
require 'PageableAR'
require 'angular-file-saver'
require 'ng-file-upload'
		
angular.module 'starter.model', ['PageableAR', 'ngFileSaver', 'ngFileUpload']
	
  .factory 'model', (pageableAR, $http, $filter, $log, FileSaver, Upload, $state) ->

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
  
    VoteType: VoteType
    VoteTypeList: VoteTypeList
    Vote: Vote
    VoteList: VoteList 	
    Breakdown: Breakdown
    BreakdownList: BreakdownList
    Summary: Summary
    User: User	
