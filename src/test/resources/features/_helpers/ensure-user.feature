Feature: Ensure user exists (signup si no existe)

Scenario: Ensure user exists
  * def username = karate.get('username')
  * def password = karate.get('password')

  * url baseUrl
  * path 'signup'
  * header Content-Type = 'application/json'
  * request { username: '#(username)', password: '#(password)' }
  * method post

  * def sc = responseStatus
  * assert sc == 200 || sc == 500

  * karate.log('ensure-user -> username:', username, 'status:', sc, 'response:', response)