viewport = MOAIViewport.new ()
viewport:setSize ( 960, 640 )
viewport:setScale ( 960, 640 )

layer = MOAILayer2D.new ()
layer:setViewport ( viewport )
MOAISim.pushRenderPass ( layer )

texture = MOAIGfxQuad2D.new ()
texture:setTexture ( "../test.png" )
texture:setRect ( -64, -64, 64, 64 )

prop = MOAIProp2D.new ()
prop:setDeck ( texture )
layer:insertProp ( prop )

curve = MOAIAnimCurve.new ()
curve:reserveKeys ( 100 )
curve:setKey ( 1, 0, 0 )
curve:setKey ( 25, 0.5, 200 )
curve:setKey ( 99, 1, 0 )

anim = MOAIAnim.new ()
anim:reserveLinks ( 1 )
anim:setLink ( 1, curve, prop, MOAIProp2D.ATTR_Y_LOC )
anim:setMode ( MOAITimer.LOOP )
anim:start ()

MOAISim.openWindow ( "stress test", 960, 640 )
