var gulp = require("gulp");
var sass = require("gulp-sass");
var plumber = require("gulp-plumber");
var browserSync = require("browser-sync");
var notify = require("gulp-notify");

gulp.task('default', ['sass', 'browser-sync', 'watch']);

//sassとpugの監視をして変換処理させる
gulp.task('watch', () => {
    gulp.watch(['./app/assets/sass/**'], () => {
		gulp.start(['sass']);
    });
});

//ブラウザ表示
gulp.task('browser-sync', () => {
    browserSync({
		proxy: "192.168.33.10:3000",
		//open: false,
		port:3001,
		//ui: {
		//	port: 3001,
		//}
        //server: {
	    //    baseDir: "./"   //サーバとなるrootディレクトリ
        //}
	});
//ファイルの監視
//以下のファイルが変わったらリロードする
	gulp.watch("./app/assets/javascripts/**/*.js",	['reload']);
	gulp.watch("./app/assets/images/**/*",			['reload']);
	gulp.watch("./app/assets/stylesheets/**/*.css",	['reload']);
	gulp.watch("./app/views/**/*.erb",				['reload']);
   	gulp.watch("./app/controllers/**/*.rb",			['reload']);
    gulp.watch("./app/models/**/*.rb",				['reload']);
});
//sassをcssに変換
gulp.task("sass", () => {
	gulp.src("./app/assets/sass/**/*.scss")
		.pipe(plumber({
			errorHandler: notify.onError("Error: <%= error.message %>")
        }))
		.pipe(sass())
		.pipe(gulp.dest("./app/assets/stylesheets"))
		//reloadせずにinjectする
        .pipe(browserSync.stream())
});
//ブラウザリロード処理
gulp.task('reload', () => {
	browserSync.reload();
});
