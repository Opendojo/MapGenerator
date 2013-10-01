require.config(
  baseUrl: 'script/',
  paths:
    jquery: 'vendor/jquery-2.0.3.min'
    app: 'application/'
)
define ['jquery','app/MapGenerator'], ($,MapGenerator) ->
  $(document).ready ()->
    console.log "Hello world"
    map = new MapGenerator()
    map.webGLStart()