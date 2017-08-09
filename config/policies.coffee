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
			create:		['isAuth','isAdmin']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth','isAdmin']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth','isAdmin']
			populate:	['isAuth']
		BreakdownController:
			'*':		false 
			create:		['isAuth','setOwner']
			find:		['isAuth']
			findOne:	['isAuth']
			update:		['isAuth','isOwner']
			add:		['isAuth']
			remove:		['isAuth']
			destroy:	['isAuth']
			populate:	['isAuth']
