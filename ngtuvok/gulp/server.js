'use strict';

var gulp = require('gulp');
var paths = gulp.paths;
var util = require('util');
var browserSync = require('browser-sync');
// var middleware = require('./proxy');
var url = require('url'); // https://www.npmjs.org/package/url
var proxy = require('proxy-middleware'); // https://www.npmjs.org/package/proxy-middleware
var modRewrite = require('connect-modrewrite');

function browserSyncInit(baseDir, files, browser) {
  browser = browser === undefined ? 'default' : browser;

  var routes = null;
  if(baseDir === paths.src || (util.isArray(baseDir) && baseDir.indexOf(paths.src) !== -1)) {
    routes = {
      '/bower_components': 'bower_components'
    };
  }

  var proxyOptions = url.parse('http://localhost:9860');
  proxyOptions.route = '/api';
  // requests to `/api/x/y/z` are proxied to `http://localhost:9860`

  browserSync.instance = browserSync.init(files, {
    startPath: '/',
    server: {
      baseDir: baseDir,
      // middleware: middleware,
      middleware: [proxy(proxyOptions),
        modRewrite([
          '!\\.\\w+$ /index.html [L]'
        ])],
      routes: routes
    },
    browser: browser
  });
}

gulp.task('serve', ['watch'], function () {
  browserSyncInit([
    paths.tmp + '/serve',
    paths.src
  ], [
    paths.tmp + '/serve/{app,components}/**/*.css',
    paths.tmp + '/serve/{app,components}/**/*.js',
    paths.src + 'src/assets/images/**/*',
    paths.tmp + '/serve/*.html',
    paths.tmp + '/serve/{app,components}/**/*.html',
    paths.src + '/{app,components}/**/*.html'
  ]);
});

gulp.task('serve:dist', ['build'], function () {
  browserSyncInit(paths.dist);
});

gulp.task('serve:e2e', ['inject'], function () {
  browserSyncInit([paths.tmp + '/serve', paths.src], null, []);
});

gulp.task('serve:e2e-dist', ['build'], function () {
  browserSyncInit(paths.dist, null, []);
});
