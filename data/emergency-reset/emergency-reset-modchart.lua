function onCreatePost()
    for i = 4,7 do 
        if downscroll then
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 + 250, 0.0005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 - 250, 0.0005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    pincerPrepare(1,false)
    pincerPrepare(2,false)
    pincerPrepare(3,false)
    pincerPrepare(4,false)
    pincerGrab(1)
    pincerGrab(2)
    pincerGrab(3)
    pincerGrab(4)
    for m = 1,4 do
        setProperty('pincer'..m..'.alpha', 0)
    end
end

function onSongStart()
    for i = 4,7 do
        noteTweenY('noteTweenStartY'..i, i, defaultPlayerStrumY0, 2.5/getProperty('playbackRate'), 'sineInOut')
        for m = 1,4 do
            setProperty('pincer'..m..'.alpha', 1)
        end
    end
end

local pincerEffect = false
local value = 25
function onUpdate(elapsed)
    -- note effect recreation ig
    beat = (getSongPosition()/1000) * (bpm / 60)
    if pincerEffect == true then 
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat*2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat*2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 35 + 25 * math.cos((beat + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 25 + 25 * math.cos((beat + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 25 + 25 * math.cos((beat + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 35 + 25 * math.cos((beat + 7*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 20 + 25 * math.cos((beat + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 10 + 25 * math.cos((beat + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 10 + 25 * math.cos((beat + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 20 + 25 * math.cos((beat + 7*0.25) * math.pi))
        end
    end

    -- this shit will move pincers to the current note position - makes easy to move notes LMFAO
    pincerTweenX("NoteMovePincer1X",1,getPropertyFromGroup('strumLineNotes', 4, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer2X",2,getPropertyFromGroup('strumLineNotes', 5, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer3X",3,getPropertyFromGroup('strumLineNotes', 6, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenX("NoteMovePincer4X",4,getPropertyFromGroup('strumLineNotes', 7, 'x'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer1Y",1,getPropertyFromGroup('strumLineNotes', 4, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer2Y",2,getPropertyFromGroup('strumLineNotes', 5, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer3Y",3,getPropertyFromGroup('strumLineNotes', 6, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')
    pincerTweenY("NoteMovePincer4Y",4,getPropertyFromGroup('strumLineNotes', 7, 'y'), 0.0005/getProperty('playbackRate'), 'sineInOut')

    if value == 75 then
        value = 50
    end
end

local coolNum = 0 
local insaneBeatEffect = false
local normalBeatEffect = false
local noteBounceEffect = false
function onBeatHit()
    -- effects
    if normalBeatEffect == true then
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', 2.5)
            setProperty('camHUD.zoom', 0.95)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.75/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 4 == 0 then
            setProperty('camHUD.angle', -2.5)
            setProperty('camHUD.zoom', 0.95)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.75/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if insaneBeatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 2.5)
            setProperty('camHUD.zoom', 1.05)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -2.5)
            setProperty('camHUD.zoom', 1.05)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if noteBounceEffect == true then
        if curBeat % 1 == 0 then
            for i = 4,7 do
                setPropertyFromGroup('strumLineNotes', i, 'direction', 100)
                noteTweenDirection('noteDirection'..i, i, 90, 0.15/getProperty('playbackRate'), 'circOut')
                setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x')+value)
                noteTweenX('noteTweenX0', 4, defaultPlayerStrumX0-coolNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX1', 5, defaultPlayerStrumX1-(coolNum/2), 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX2', 6, defaultPlayerStrumX2+(coolNum/2), 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX3', 7, defaultPlayerStrumX3+coolNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            end
        end

        if curBeat % 2 == 0 then
            for i = 4,7 do
                setPropertyFromGroup('strumLineNotes', i, 'direction', 80)
                noteTweenDirection('noteDirection'..i, i, 90, 0.15/getProperty('playbackRate'), 'circOut')
                setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x')-(value+25))
                noteTweenX('noteTweenX0', 4, defaultPlayerStrumX0-coolNum, 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX1', 5, defaultPlayerStrumX1-(coolNum/2), 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX2', 6, defaultPlayerStrumX2+(coolNum/2), 0.15/getProperty('playbackRate'), 'sineInOut')
                noteTweenX('noteTweenX3', 7, defaultPlayerStrumX3+coolNum, 0.15/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    -- MODCHART
    if curBeat == 16 then
        for i = 4,7 do
            cancel('noteTweenStartY'..i)
            noteTweenY('noteTweenStartEndY'..i, i, defaultPlayerStrumY0, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 63 then
        noteBounceEffect = true
    end
    if curBeat == 160 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 9.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
        else
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 40, 9.5/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 40, 9.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
        
    --idk what is this
    if curBeat == 176 or curBeat == 178 or curBeat == 180 or curBeat == 182 or curBeat == 184 or curBeat == 186 or curBeat == 188 then
        coolNum = coolNum + 4
    end
    if curBeat == 190 then
        for i = 4,7 do
            noteTweenDirection('noteDirection'..i, i, 90, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
        noteBounceEffect = false
        coolNum = 0
        noteTweenX('noteTweenX0', 4, defaultPlayerStrumX0-100, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('noteTweenX1', 5, defaultPlayerStrumX1-50, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('noteTweenX2', 6, defaultPlayerStrumX2+25, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('noteTweenX3', 7, defaultPlayerStrumX3+75, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0-50, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1-100, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2-75, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3-25, 0.005/getProperty('playbackRate'), 'sineInOut')

        cancelTween('camHUDZoom')
        doTweenAngle('camHUDAngle', 'camHUD', 25, 2/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineOut')
        doTweenAngle('camGameAngle', 'camGame', 25, 2/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineOut')
    end
    if curBeat == 192 then
        setProperty('defaultCamHUDZoom', 0.85)

        cancelTween('camHUDAngle')
        cancelTween('camHUDZoom')
        cancelTween('camGameAngle')
        cancelTween('camGameZoom')
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.005/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.005/getProperty('playbackRate'), 'sineOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.005/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.005/getProperty('playbackRate'), 'sineOut')

        noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 0.005/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 0.005/getProperty('playbackRate'), 'sineInOut')
        pincerEffect = true
    end

    if curBeat == 254 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end


    if curBeat == 316 then
        pincerEffect = false
        noteTweenX("NoteMove1OXSTART",0,defaultPlayerStrumX0-32, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OXSTART",1,defaultPlayerStrumX1-16, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OXSTART",2,defaultPlayerStrumX2+16, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OXSTART",3,defaultPlayerStrumX3+32, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0.15, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.15, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.15, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.15, 0.15/getProperty('playbackRate'), 'sineInOut')

        noteTweenY("NoteMove1YSTART",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2YSTART",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3YSTART",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4YSTART",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1XSTART",4,defaultPlayerStrumX0-32, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2XSTART",5,defaultPlayerStrumX1-16, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3XSTART",6,defaultPlayerStrumX2+16, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4XSTART",7,defaultPlayerStrumX3+32, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    -- the hardest shit i think
    if curBeat == 320 or curBeat == 336 or curBeat == 352 or curBeat == 368 or curBeat == 384 or curBeat == 400 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 322 or curBeat == 338 or curBeat == 354 or curBeat == 370 or curBeat == 386 or curBeat == 402 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 323 or curBeat == 339 or curBeat == 355 or curBeat == 371 or curBeat == 387 or curBeat == 403 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 50+32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 325 or curBeat == 341 or curBeat == 357 or curBeat == 373 or curBeat == 389 or curBeat == 405 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 50-32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 326 or curBeat == 342 or curBeat == 358 or curBeat == 374 or curBeat == 390 or curBeat == 406 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 50+32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 328 or curBeat == 344 or curBeat == 360 or curBeat == 376 or curBeat == 392 or curBeat == 408 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 330 or curBeat == 346 or curBeat == 362 or curBeat == 378 or curBeat == 394 or curBeat == 410 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 331 or curBeat == 347 or curBeat == 363 or curBeat == 379 or curBeat == 395 or curBeat == 411 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 50-32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 333 or curBeat == 349 or curBeat == 365 or curBeat == 381 or curBeat == 397 or curBeat == 413 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 50+32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 334 or curBeat == 350 or curBeat == 366 or curBeat == 382 or curBeat == 398 or curBeat == 414 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 50-32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 335 or curBeat == 351 or curBeat == 367 or curBeat == 383 or curBeat == 399 or curBeat == 415 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 50+32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 416 or curBeat == 424 or curBeat == 432 or curBeat == 440 then
        if downscroll then
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove1Y",4,defaultPlayerStrumY0 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0 - 50-32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 417 or curBeat == 425 or curBeat == 433 or curBeat == 441 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 418 or curBeat == 426 or curBeat == 434 or curBeat == 442 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 419 or curBeat == 427 or curBeat == 435 or curBeat == 443 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 420 or curBeat == 428 or curBeat == 436 or curBeat == 444 then
        if downscroll then
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove4Y",7,defaultPlayerStrumY3 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3 + 50+32, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 421 or curBeat == 429 or curBeat == 437 or curBeat == 445 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 422 or curBeat == 430 or curBeat == 438 then
        if downscroll then
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove2Y",5,defaultPlayerStrumY1 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 423 or curBeat == 431 or curBeat == 439 then
        if downscroll then
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 - 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        else
            noteTweenY("NoteMove3Y",6,defaultPlayerStrumY2 + 75, 0.005/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 446 then
        for i = 0,3 do
            noteTweenAlpha('playerNoteAlpha'..i, i, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 448 then
        pincerEffect = true
    end

    if curBeat == 510 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 511 then
        normalBeatEffect = true
    end

    if curBeat == 559 then
        normalBeatEffect = false
        insaneBeatEffect = true
    end

    if curBeat == 575 then
        insaneBeatEffect = false
    end

    if curBeat == 576 then
        pincerEffect = false
        for i = 0,3 do
            noteTweenAlpha('playerNoteAlpha'..i, i, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenY("NoteMove1OYEND",0,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2OYEND",1,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3OYEND",2,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4OYEND",3,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1OXEND",0,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OXEND",1,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OXEND",2,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OXEND",3,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenY("NoteMove1YEND",4,defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove2YEND",5,defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove3YEND",6,defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteMove4YEND",7,defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1XEND",4,defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2XEND",5,defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3XEND",6,defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4XEND",7,defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end


    if curBeat == 640 then
        for i = 4,7 do 
            if downscroll then
                noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 + 300, 2/getProperty('playbackRate'), 'sineInOut')
            else
                noteTweenY('noteTweeny'..i, i, defaultPlayerStrumY0 - 300, 2/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    if curBeat == 656 then
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'NoteMove1Y' then
        noteTweenY('NoteMove1YFinish',4,defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove2Y' then
        noteTweenY('NoteMove2YFinish',5,defaultPlayerStrumY1, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove3Y' then
        noteTweenY('NoteMove3YFinish',6,defaultPlayerStrumY2, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove4Y' then
        noteTweenY('NoteMove4YFinish',7,defaultPlayerStrumY3, 0.25/getProperty('playbackRate'), 'sineInOut')
    end

    if tag == 'NoteMove1X' then
        noteTweenX("NoteMove1XFinish",4,defaultPlayerStrumX0-32, 0.25/getProperty('playbackRate'), 'sineInOut')
    elseif tag == 'NoteMove4X' then
        noteTweenX("NoteMove4XFinish",7,defaultPlayerStrumX3+32, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
end