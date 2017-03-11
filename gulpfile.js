/**
 * Created by Work on 10/26/2016.
 */

// fix memory leak warning
require('events').EventEmitter.defaultMaxListeners = Infinity;

// var $           = require('gulp-load-plugins')();
var gulp = require('gulp'),
    browserSync = require('browser-sync'),
    plumber = require('gulp-plumber'),
    imagemin = require('gulp-imagemin');

var images_path = './coachhousegoole.box/htdocs/wp-content/uploads';

gulp.task('default', function () {
    init_watch(true, 3001, {target: 'https://coachhousegoole.box'});
});

gulp.task('optimize:img', function () {
    gulp.src(images_path + '**/*.{png,jpg,gif}')
        .pipe(imagemin({
            optimizationLevel: 7,
            progressive: true
        }))
        .pipe(gulp.dest(function (file) {
            return file.base;
        }));
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

    //   gulp.watch([path.source + 'styles/**/*'], ['styles']);
    //   gulp.watch([path.source + 'scripts/**/*'], ['jshint', 'scripts']);
    //   gulp.watch([path.source + 'fonts/**/*'], ['fonts']);
    //   gulp.watch([path.source + 'images/**/*'], ['images']);
    //   gulp.watch(['bower.json', 'assets/manifest.json'], ['build']);
    gulp.watch(['./coachhousegoole.box/htdocs/wp-content/themes/**/*', '!./coachhousegoole.box/htdocs/wp-content/themes/**/*.scss'], function () {
        browserSync.reload();
    });
}