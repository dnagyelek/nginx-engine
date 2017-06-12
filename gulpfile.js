/**
 * Created by Work on 10/26/2016.
 */

// fix memory leak warning
require('events').EventEmitter.defaultMaxListeners = Infinity;

// var $           = require('gulp-load-plugins')();
var gulp = require('gulp'),
    browserSync = require('browser-sync'),
    plumber = require('gulp-plumber'),

    // your-expected-site-name
    watch_path = './your-expected-site-name/htdocs/wp-content/',
    // change site-theme
    browser_sync = watch_path + 'themes/site-theme/';


gulp.task('default', function () {
    // your-expected-site-name.box
    init_watch(true, 3001, {target: 'https://your-expected-site-name.box'});
});

function init_watch(https, port, proxy) {

    var defaults = {
        port: 3001
//        https: true,
//        proxy: config.devUrl // { target: 'http://your-expected-site-name.com' }
    };

    if (typeof https !== 'boolean') {
        https = defaults.https;
    }
    if (typeof port !== 'number') {
        port = defaults.port;
    }
    if (typeof proxy === 'string') {
        proxy = {target: proxy};
    } // fix the format if only target is passed
    if (typeof proxy !== 'object') {
        proxy = defaults.proxy;
    }

    browserSync({
        proxy: proxy,
        https: https,
        port: port,
        snippetOptions: {
            whitelist: ['/wp-admin/admin-ajax.php'],
            blacklist: ['/wp-admin/**']
        }
    });

    gulp.watch([browser_sync + '/**/*',
        // no babysit for minified nor scss
        '!' + browser_sync + '/**/*.min.css',
        '!' + browser_sync + '/**/*.scss'], function () {
        browserSync.reload();
    });
}