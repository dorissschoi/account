env = require './env.coffee'
Promise = require 'promise'

angular
  .module 'starter.controller', [
    'ionic' 
    'ngCordova'
    'http-auth-interceptor'
    'starter.model'
    'platform'
  ]
	
  .controller 'MenuCtrl', ($scope) ->
    _.extend $scope,
      env: env
      navigator: navigator

  .controller 'VoteTypeListCtrl', ($scope, collection, $location, $ionicPopup) ->
    _.extend $scope,
      collection: collection
      loadMore: ->
        collection.$fetch()
          .then ->
            $scope.$broadcast('scroll.infiniteScrollComplete')
          .catch alert
						
  .controller 'VoteListCtrl', ($scope, collection, $location, $ionicPopup) ->
    _.extend $scope,
      collection: collection
      summary: (vote) ->
        $location.url "/breakdown/summary/#{vote.id}"
      loadMore: ->
        collection.$fetch()
          .then ->
            $scope.$broadcast('scroll.infiniteScrollComplete')
          .catch alert

  .controller 'SummaryCtrl', ($scope, model, $location) ->
    _.extend $scope,
      model: model

  .controller 'BreakdownListCtrl', ($scope, collection, $location, $ionicPopup) ->
    _.extend $scope,
      collection: collection
      loadMore: ->
        collection.$fetch()
          .then ->
            $scope.$broadcast('scroll.infiniteScrollComplete')
          .catch alert

  .controller 'ItemCtrl', ($scope, $log, $ionicActionSheet, $location) ->
    _.extend $scope,
      showAction: ->
        return true
