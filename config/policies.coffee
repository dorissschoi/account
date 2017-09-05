module.exports = 
  policies:    
    VoteTypeController:
      '*':       false 
      create:    ['isAuth','isAdmin']
      find:      ['isAuth']
      findOne:   ['isAuth']
      update:    ['isAuth','isAdmin']
      add:       ['isAuth']
      remove:    ['isAuth']
      destroy:   ['isAuth','isAdmin']
      populate:  ['isAuth']
    VoteController:
      '*':       false 
      create:    ['isAuth','isAdmin']
      find:      ['isAuth']
      findOne:   ['isAuth']
      update:    ['isAuth','isAdmin']
      add:       ['isAuth']
      remove:    ['isAuth']
      destroy:   ['isAuth','isAdmin']
      populate:  ['isAuth']
    UserController:
      '*':       false 
      create:    ['isAuth','isAdmin']
      find:      ['isAuth']
      findOne:   ['isAuth']
      update:    ['isAuth','isAdmin']
      add:       ['isAuth']
      remove:    ['isAuth']
      destroy:   ['isAuth','isAdmin']
      populate:  ['isAuth']
    BreakdownController:
      '*':       false 
      create:    ['isAuth','setCreatedBy']
      find:      ['isAuth']
      findOne:   ['isAuth']
      update:    ['isAuth','canUpdate']
      add:       ['isAuth','canUpdate']
      remove:    ['isAuth','canUpdate']
      destroy:   ['isAuth','canUpdate']
      populate:  ['isAuth']
      summary:   ['isAuth']
      status:    ['isAuth']
      getStatus: ['isAuth'] 
      getType:   ['isAuth'] 
