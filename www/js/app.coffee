env = require './env.coffee'
require 'log_toast'

angular
  .module 'starter', [
    'ionic', 
    'starter.controller', 
    'starter.model', 
    'util.auth', 
    'ionic-datepicker', 
    'ngFancySelect', 
    'pascalprecht.translate', 
    'locale'
    'logToast'
  ]

  .run (authService) ->
    authService.login env.oauth2().opts
		
  .run ($rootScope, platform, $ionicPlatform, $location, $http) ->
    $ionicPlatform.ready ->
      if (window.cordova && window.cordova.plugins.Keyboard)
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true)
      if (window.StatusBar)
        StatusBar.styleDefault()
						
  .config ($stateProvider, $urlRouterProvider) ->
    $stateProvider.state 'app',
      url: ""
      abstract: true
      templateUrl: "templates/menu.html"
	
  # Account 
    $stateProvider.state 'app.votetypeList',
      url: "/votetype/list"
      cache: false
      views:
        'menuContent':
          templateUrl: "templates/votetype/list.html"
          controller: 'VoteTypeListCtrl'
      resolve:
        cliModel: 'model'
        collection: (cliModel) ->
          ret = new cliModel.VoteTypeList()
          ret.$fetch()

    $stateProvider.state 'app.voteList',
      url: "/vote/list"
      cache: false
      views:
        'menuContent':
          templateUrl: "templates/vote/list.html"
          controller: 'VoteListCtrl'
      resolve:
        cliModel: 'model'	
        collection: (cliModel) ->
          ret = new cliModel.VoteList()
          ret.$fetch()

    $stateProvider.state 'app.SummaryList',
      url: "/breakdown/summary/:id"
      cache: false
      views:
        'menuContent':
          templateUrl: "templates/vote/summary.html"
          controller: 'SummaryCtrl'
      resolve:
        id: ($stateParams) ->
          $stateParams.id
        cliModel: 'model'
        model: (cliModel, id) ->
          ret = new cliModel.Summary()
          ret.$fetch params: {vote: id}

    $stateProvider.state 'app.breakdownList',
      url: "/breakdown/list"
      cache: false
      views:
        'menuContent':
          templateUrl: "templates/breakdown/list.html"
          controller: 'BreakdownListCtrl'
      resolve:
        cliModel: 'model'
        collection: (cliModel) ->
          ret = new cliModel.BreakdownList()
          ret.$fetch()
				
    $urlRouterProvider.otherwise('/vote/list')
