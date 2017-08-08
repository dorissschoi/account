_ = require 'lodash'
passport = require 'passport'
bearer = require 'passport-http-bearer'
Promise = require 'bluebird'
needle = Promise.promisifyAll require 'needle'

# check if oauth2 bearer is available
verifyToken = (token) ->
	oauth2 = sails.config.oauth2
	
	return new Promise (fulfill, reject) ->
		opts = headers:
			Authorization: "Bearer #{token}"
		needle.getAsync oauth2.verifyURL, opts
			.then (res) -> 
				# check required scope authorized or not
				scope = res.body.scope.split(' ')
				result = _.intersection scope, oauth2.scope
				if result.length != oauth2.scope.length
					return reject('Unauthorized access to #{oauth2.scope}')
				fulfill res.body.user
			.catch reject
			
passport.use 'bearer', new bearer.Strategy {}, (token, done) ->
	fulfill = (user) ->
		user.token = token
		done(null, user)
	reject = (err) ->
		done(null, false, message: err)
	verifyToken(token).then fulfill, reject
	
module.exports = (req, res, next) ->
	if req.isSocket
		req = _.extend req, _.pick(require('http').IncomingMessage.prototype, 'login', 'logIn', 'logout', 'logOut', 'isAuthenticated', 'isUnauthenticated')
	middleware = passport.authenticate('bearer', { session: false })
	middleware req, res, ->
		if req.isSocket
			req.socket.user = req.user
		next()
