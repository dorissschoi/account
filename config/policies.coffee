module.exports = 
	policies:		
		VoteTypeController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			update:		['isAuth']
			add:		['isAuth']
		VoteController:
			'*':		false 
			create:		['isAuth']
			find:		['isAuth']
			update:		['isAuth']
			add:		['isAuth']
