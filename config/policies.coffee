module.exports = 
	policies:		
		VoteTypeController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth']
			populate:	['isAuth']
		VoteController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth']
			populate:	['isAuth']
		UserController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth']
			populate:	['isAuth']
		BreakdownController:
			'*':		false 
			create:		['isAuth','setOwner']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth']
			populate:	['isAuth']
