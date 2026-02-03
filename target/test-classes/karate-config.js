function fn() {
  var env = karate.env; // se puede setear con -Dkarate.env=...
  if (!env) env = 'dev';

  var config = {
    env: env,
    baseUrl: 'https://api.demoblaze.com',
    defaultHeaders: { 'Content-Type': 'application/json' },

    // helpers
    randomUser: function(prefix){
      prefix = prefix || 'qa_';
      // username simple y único
      return prefix + java.util.UUID.randomUUID().toString().replaceAll('-', '').substring(0, 12);
    }
  };

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);

  return config;
}
