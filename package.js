Package.describe({
  name: 'peerlibrary:check-extension',
  summary: "Extensions to the built-in check package",
  version: '0.7.0',
  git: 'https://github.com/peerlibrary/meteor-check-extension.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.8.1');

  // Core dependencies.
  api.use([
    'coffeescript@2.4.1',
    'ecmascript',
    'check',
    'underscore'
  ]);

  api.imply([
    'check'
  ]);

  api.mainModule('lib.coffee');
});
