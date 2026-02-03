Feature: Signup - Demoblaze API

Background:
  * url baseUrl
  * path 'signup'
  * header Content-Type = 'application/json'

# ============================================
# SIGNUP NUEVO USUARIO (JSON) - USERNAME ÚNICO
# ============================================
Scenario: Crear nuevo usuario (signup) - username único
  * def req = read('classpath:data/signup_new.json')
  * def uniqueUser = req.username + '_' + java.util.UUID.randomUUID().toString().substring(0, 6)
  * def pass = req.password

  Given request { username: '#(uniqueUser)', password: '#(pass)' }
  When method post

  * def sc = responseStatus
  * assert sc == 200 || sc == 500

  # Si 200, NO debería decir "already exist" porque el user es único
  * assert sc != 200 || response == null || (('' + response).toLowerCase().indexOf('already exist') < 0)

  * karate.log('Signup nuevo (unique) -> user:', uniqueUser, 'status:', sc, 'responseType:', responseType, 'response:', response)

# ============================================
# SIGNUP USUARIO EXISTENTE (CSV)
# ============================================
Scenario Outline: Intentar crear usuario existente (signup) desde CSV
  * def row = __row
  Given request { username: '#(row.username)', password: '#(row.password)' }
  When method post

  * def sc = responseStatus
  * assert sc == 200 || sc == 500

  # si sc == 200 => normalmente texto: "This user already exist."
  * assert sc != 200 || (('' + response).indexOf(row.expectedMessage) >= 0)

  # si sc == 500 => puede variar, pero response debe existir
  * assert sc != 500 || response != null

  * karate.log('Signup existente -> status:', sc, 'responseType:', responseType, 'response:', response)

Examples:
  | __row |
  | read('classpath:data/signup_existing.csv') |