gulp = require('gulp')
coffee = require('gulp-coffee')
gutil = require('gulp-util')
stylus = require('gulp-stylus') 
connect = require('connect')
httpServer = connect().use(connect.static('./public')) 

src =
  coffee: './scripts/*.coffee'
  html: './html/*.html'
  img: './images/*'
  stylusMain: './styles/main.styl'
  stylusAll: './styles/*.styl'

dst = 
  js: './public/js'
  css: './public/css'
  html: './public'
  img: './public/images'

gulp.task('coffee', ->
  gulp.src(src.coffee)
    .pipe(coffee(bare: true).on('error', gutil.log))
    .pipe(gulp.dest(dst.js))
)

gulp.task('server', ->
  httpServer.listen(3000)
  gutil.log("Listening on port 3000")
)

gulp.task('stylus', ->  
    gulp.src(src.stylusAll)
    .pipe(stylus(
        use: ['nib']
        compress: true
    ))
    .pipe(gulp.dest(dst.css))
)

gulp.task('html', ->
  gulp.src(src.html)
  .pipe(gulp.dest(dst.html))
)

gulp.task('images', ->
  gulp.src(src.img)
  .pipe(gulp.dest(dst.img))
)

gulp.task('watch', ->
  gulp.watch(src.stylusAll, ['stylus'])
  gulp.watch(src.coffee, ['coffee'])
  gulp.watch(src.html, ['html'])
  gulp.watch(src.img, ['images'])
)

gulp.task('default',['server', 'coffee','stylus', 'html', 'images', 'watch'])
