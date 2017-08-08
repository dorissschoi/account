module.exports = 
	policies:		
		VoteTypeController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
		VoteController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
		UserController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
		BreakdownController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
