local composer = require( "composer" )

local scene = composer.newScene()

local myTitle

function scene:create( event )

	myTitle = display.newText( self.view, "Goto menu!", display.contentCenterX, display.contentCenterY, native.systemFont, 25 )

    function onTouchText( event )
    	composer.gotoScene("menu","fade")
    end
	myTitle:addEventListener( "tap", onTouchText )

end

function scene:show( event )
	if ( event.phase == "will" ) then
		print("will")
		myTitle.alpha = 0

		print("Get a parameter:",event.params.sampleParam)
	elseif ( event.phase == "did" ) then
		print("did")
		transition.to( myTitle, {time=1000,alpha=1} )
	end
end

function scene:hide( event )
	if ( event.phase == "will" ) then
	elseif ( event.phase == "did" ) then
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene