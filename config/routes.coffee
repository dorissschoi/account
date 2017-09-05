module.exports = 
  routes:
    'GET /api/breakdown/vote/:vote/summary':
      controller: 'BreakdownController'
      action: 'summary'

    'GET /api/breakdown/status':
      controller: 'BreakdownController'
      action: 'status'

    'GET /api/breakdown/getstatus':
      controller: 'BreakdownController'
      action: 'getStatus'
      sort:
        name: 'asc'

    'GET /api/breakdown/gettype':
      controller: 'BreakdownController'
      action: 'getType'
      sort:
        name: 'asc'
