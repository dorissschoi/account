module.exports = 
  routes:
    'GET /api/breakdown/vote/:vote/summary':
      controller: 'BreakdownController'
      action: 'summary'

    'GET /api/breakdown/status':
      controller: 'BreakdownController'
      action: 'status'
