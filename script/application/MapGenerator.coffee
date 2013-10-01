define ['jquery','vendor/gl-matrix-min'],($,glMatrix)->
  class MapGenerator
    webGLStart:() ->
      canvas = document.getElementById("#map")
      @initGL(canvas)
      @initShaders()
      @initBuffers()

      gl.clearColor(0.0, 0.0, 0.0, 1.0)
      gl.enable(gl.DEPTH_TEST)

      drawScene()
