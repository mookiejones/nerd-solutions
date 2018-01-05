Package.describe({
  name: 'nerd',
  version: '0.0.1',
  summary: '',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.use(['templating','underscore']);
  api.versionsFrom('1.1.0.2');
  api.use('jquery');
  api.addFiles('nerd.js');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('nerd');
  api.addFiles('nerd-tests.js');
});
