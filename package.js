Package.describe({
  name: 'peerlibrary:check-extension',
  summary: "Extensions to the built-in check package",
  version: '0.5.0',
  git: 'https://github.com/peerlibrary/meteor-check-extension.git'
});

Package.onUse(function (api) {
  api.versionsFrom('METEOR@1.4.4.5');

  // Core dependencies.
  api.use([
    'coffeescript@2.0.3_3',
    'ecmascript',
    'check',
    'underscore'
  ]);

  api.imply([
    'check'
  ]);

  api.mainModule('lib.coffee');
});
