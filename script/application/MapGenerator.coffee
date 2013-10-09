define ['jquery','vendor/gl-matrix-min','app/libs/utils'],($,glMatrix,Utils)->
  class MapGenerator
    webGLStart:() ->
      canvas = document.getElementById("map")
      @initGL(canvas)
      @initShaders()
      @initBuffers()
      @objectsVertices = [
        [
          0.0, 1.0, 0.0,
          -1.0, -1.0, 0.0,
          1.0, -1.0, 0.0
        ],[
          1.0, 1.0, 0.0,
          -1.0, 1.0, 0.0,
          1.0, -1.0, 0.0,
          -1.0, -1.0, 0.0
        ]
      ]
      @positionBuffers = []

      #@gl.clearColor(0.0, 0.0, 0.0, 1.0)
      #@gl.enable(gl.DEPTH_TEST)

      @drawScene()

    initGL:(canvas)->
      try
        @gl = canvas.getContext('webgl') || canvas.getContext('experimental-webgl')
        @gl.viewportWidth = canvas.width
        @gl.viewportHeight = canvas.height
      catch e
        Utils.debug "Exception catched", e.toString()
      if !@gl
        Utils.debug "No webGL, end of the story"

    initShaders:()->

    initBuffers:()->
      for objectVertices of @objectsVertices
        positionBuffer = gl.createBuffer()
        gl.bindBuffer(gl.ARRAY_BUFFER, positionBuffer)
        gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(objectVertices), gl.STATIC_DRAW)
        positionBuffer.itemSize = 3
        positionBuffer.numItems = objectVertices.length/3
        @positionBuffers.push(positionBuffer)


    drawScene:()->
      @gl.viewport(0,0,@gl.viewportWidth,@gl.viewportHeight)
      @gl.clear(gl.COLOR_BUFFER_BIT|gl.DEPTH_BUFFER_BIT)
      mat4.perspective(45,gl.viewportWidth/gl.viewportHeight,0.1,100,pMatrix)
