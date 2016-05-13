Package.describe({
  name: 'peerlibrary:check-extension',
  summary: "Extensions to the built-in check package",
  version: '0.2.1',
  git: 'https://github.com/peerlibrary/meteor-check-extension.git'
});

Package.onUse(function (api) {
  api.versionsFrom('1.0.3.1');

  // Core dependencies.
  api.use([
    'check',
    'coffeescript',
    'underscore'
  ]);

  api.imply([
    'check'
  ]);

  // Client and server.
  api.addFiles([
    'lib/match.coffee'
  ]);
});

