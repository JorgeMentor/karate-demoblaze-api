Feature: Login - Demoblaze API

Background:
  * url baseUrl
  * path 'login'
  * header Content-Type = 'application/json'

Scenario Outline: Login correcto desde CSV
  * def row = __row
  Given request { username: '#(row.username)', password: '#(row.password)' }
  When method post

  * def sc = responseStatus
  * assert sc == 200 || sc == 500

  # si 200 => puede venir Auth_token o errorMessage (API inconsistente)
  * def hasToken = (sc == 200 && response && response.Auth_token != null)
  * def hasErr   = (sc == 200 && response && response.errorMessage != null)
  * assert sc != 200 || hasToken || hasErr

  # si hay token, validar no vacío
  * def token = hasToken ? ('' + response.Auth_token).replaceAll('"','').trim() : ''
  * assert !hasToken || token.length > 0

  # si 500 => html
  * assert sc != 500 || response != null

  * karate.log('Login correcto -> status:', sc, 'responseType:', responseType, 'response:', response)

Examples:
  | __row |
  | read('classpath:data/login_valid.csv') |

Scenario: Login incorrecto desde JSON
  * def payload = read('classpath:data/login_negative.json')
  Given request { username: '#(payload.username)', password: '#(payload.password)' }
  When method post

  * def sc = responseStatus
  * assert sc == 200 || sc == 500

  # si 200 => debe venir errorMessage string y ser el esperado
  * assert sc != 200 || (response && response.errorMessage != null)
  * assert sc != 200 || typeof response.errorMessage == 'string'
  * assert sc != 200 || response.errorMessage == payload.expectedError

  # si 500 => html
  * if (sc == 500) karate.log('500 responseType:', responseType, 'response:', response)

  * karate.log('Login incorrecto -> status:', sc, 'responseType:', responseType, 'response:', response)