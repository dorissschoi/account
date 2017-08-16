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
    class Vote extends pageableAR.Model
      $urlRoot: "api/vote/"

    class VoteList extends pageableAR.PageableCollection
      model: Vote

      $urlRoot: "api/vote/"    

  

    Vote: Vote
    VoteList: VoteList 	
    User: User	
