"use strict";

var gulp = require("gulp");
var less = require("gulp-less");
var plumber = require("gulp-plumber");
var server = require("browser-sync").create();
var concat = require('gulp-concat');
var gulpif = require('gulp-if');
var uglify = require('gulp-uglify');
var uglifycss = require('gulp-uglifycss');
var sourcemaps = require('gulp-sourcemaps');
var env = process.env.type;

gulp.task('js', function () {
  return gulp.src([
    'bower_components/jquery/dist/jquery.min.js',
    'bower_components/bootstrap/dist/js/bootstrap.min.js',
    // 'src/AppBundle/Resources/public/js/file.js'
  ])
    .pipe(concat('app.js'))
    .pipe(uglify())
    .pipe(gulp.dest('web/js'));
});

gulp.task('css', function () {
  return gulp.src([
    'bower_components/bootstrap/dist/css/bootstrap.css',
    'bower_components/font-awesome/css/font-awesome.min.css',
    // 'src/AppBundle/Resources/public/css/**/*.css'])
  ])
    .pipe(concat('custom_styles.css'))
    .pipe(uglifycss())
    .pipe(gulp.dest('web/css'));
});

gulp.task('fonts', function() {
  return gulp.src([
    'bower_components/bootstrap/dist/fonts/**/*.*',
    'bower_components/font-awesome/fonts/*.{otf,eot,ttf,woff,woff2,eof,svg}'
  ])
    .pipe(gulp.dest('web/fonts'));
});

gulp.task("style", function() {
  gulp.src("less/style.less")
    .pipe(plumber())
    .pipe(less())
    .pipe(gulp.dest("web/css"))
    .pipe(server.stream());
});

gulp.task("serve", ['style', 'js', 'css', 'fonts'], function() {
  server.init({
    server: ".",
    notify: false,
    open: true,
    cors: true,
    ui: false
  });

  gulp.watch("less/**/*.less", ["style"]);
  // gulp.watch("*.html").on("change", server.reload);
});

//define executable tasks when running "gulp" command
gulp.task('default', ['style', 'js', 'css', 'fonts']);
