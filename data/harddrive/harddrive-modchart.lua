local slowEffect = false
local mediumEffect = false
local doXthing = true
function onUpdate(elapsed)
    -- note effect recreation ig
    beat = (getSongPosition()/1000) * (bpm / 60)
    if slowEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            if doXthing then
                setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat/4 + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat/4 + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat/4 + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat/4 + 7*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat/4 + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat/4 + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat/4 + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat/4 + 7*0.25) * math.pi))
            end
        end
        setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi)/8)*5)
    end

    if mediumEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat + i*0.25) * math.pi))
            if doXthing then
                setPropertyFromGroup('strumLineNotes', 0, 'x', defaultPlayerStrumX0 - 25 + 15 * math.cos((beat/2 + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 1, 'x', defaultPlayerStrumX1 - 15 + 15 * math.cos((beat/2 + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 2, 'x', defaultPlayerStrumX2 + 15 + 15 * math.cos((beat/2 + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 3, 'x', defaultPlayerStrumX3 + 25 + 15 * math.cos((beat/2 + 7*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat/2 + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat/2 + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat/2 + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat/2 + 7*0.25) * math.pi))
            end
        end
        setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi)/4)*5)
    end
end

function onSongStart()
    slowEffect = true
end

local beatEffect = false
local shakeEffect = false
local sideMoveEffect = false
local changeScroll = false
local doNum = 1
function onBeatHit()
    -- effects
    if shakeEffect == true then
        if curBeat % 1 == 0 then
            cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
            cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
        end
    end

    if beatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 10)
            setProperty('camHUD.zoom', 1.15)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.75/getProperty('playbackRate'), 'circOut')
            cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
            cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -10)
            setProperty('camHUD.zoom', 1.15)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.75/getProperty('playbackRate'), 'circOut')
            cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
            cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if sideMoveEffect == true then
        if curBeat % 2 == 0 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 + 321);
			setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 + 321);
			setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 + 321);
			setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 + 321);
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 - 321);
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 - 321);
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 - 321);
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 - 321);
        end
        if curBeat % 4 == 0 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 321);
			setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 321);
			setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 321);
			setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 321);
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 321);
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 321);
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 321);
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 321);
        end
    end

    if changeScroll == true then
        if doNum == 1 or doNum == 4 then
            if curBeat % 1 == 0 then
                if downscroll then
                    for i = 0,3 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                        setPropertyFromGroup('playerStrums', i, 'y', defaultPlayerStrumY0-50);
                        noteTweenY("NoteMoveYS"..i+4,i+4, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                        setPropertyFromGroup('opponentStrums', i, 'y', 100);
                        noteTweenY("NoteMoveYS"..i,i, 50, 0.25/getProperty('playbackRate'), 'sineInOut')
                    end
                    setProperty("timeTxt.y", screenHeight - 44)
                    setProperty("timeBarBG.y", screenHeight - 44 + (getProperty("timeTxt.height") / 4))
                    setProperty("timeBar.y", getProperty("timeBarBG.y") + 4)
                    setProperty("healthBarBG.y", 0.11 * screenHeight)
                    setProperty("healthBar.y", 0.11 * screenHeight + 4)
                    setProperty("scoreTxt.y", 0.11 * screenHeight + 36)
                    setProperty("iconP1.y", getProperty("healthBar.y") - 75)
                    setProperty("iconP2.y", getProperty("healthBar.y") - 75)
                    setProperty("botplayTxt.y", getProperty("timeBarBG.y") - 78)
                else
                    for i = 0,3 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                        setPropertyFromGroup('playerStrums', i, 'y', defaultPlayerStrumY0+50);
                        noteTweenY("NoteMoveYS"..i+4,i+4, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                        setPropertyFromGroup('opponentStrums', i, 'y', screenHeight - 200);
                        noteTweenY("NoteMoveYS"..i,i, screenHeight - 150, 0.25/getProperty('playbackRate'), 'sineInOut')
                    end
                    setProperty("timeTxt.y", 19)
                    setProperty("timeBarBG.y", 19 + (getProperty("timeTxt.height") / 4))
                    setProperty("timeBar.y", getProperty("timeBarBG.y") + 4)
                    setProperty("healthBarBG.y", screenHeight * 0.89)
                    setProperty("healthBar.y", screenHeight * 0.89 + 4)
                    setProperty("scoreTxt.y", screenHeight * 0.89 + 36)
                    setProperty("iconP1.y", getProperty("healthBar.y") - 75)
                    setProperty("iconP2.y", getProperty("healthBar.y") - 75)
                    setProperty("botplayTxt.y", getProperty("timeBarBG.y") + 55)
                end
            end
        end

        if doNum == 2 or doNum == 3 then
            if curBeat % 1 == 0 then
                if downscroll then
                    for i = 0,3 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                        setPropertyFromGroup('playerStrums', i, 'y', 100);
                        noteTweenY("NoteMoveYS"..i+4,i+4, 50, 0.25/getProperty('playbackRate'), 'sineInOut')
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                        setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0-50);
                        noteTweenY("NoteMoveYS"..i,i, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
                    end
                    setProperty("timeTxt.y", 19)
                    setProperty("timeBarBG.y", 19 + (getProperty("timeTxt.height") / 4))
                    setProperty("timeBar.y", getProperty("timeBarBG.y") + 4)
                    setProperty("healthBarBG.y", screenHeight * 0.89)
                    setProperty("healthBar.y", screenHeight * 0.89 + 4)
                    setProperty("scoreTxt.y", screenHeight * 0.89 + 36)
                    setProperty("iconP1.y", getProperty("healthBar.y") - 75)
                    setProperty("iconP2.y", getProperty("healthBar.y") - 75)
                    setProperty("botplayTxt.y", getProperty("timeBarBG.y") + 55)
                else
                    for i = 0,3 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                        setPropertyFromGroup('playerStrums', i, 'y', screenHeight - 200);
                        noteTweenY("NoteMoveYS"..i+4,i+4, screenHeight - 150, 0.25/getProperty('playbackRate'), 'sineInOut')
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                        setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0+50);
                        noteTweenY("NoteMoveYS"..i,i, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'sineInOut')
                    end
                    setProperty("timeTxt.y", screenHeight - 44)
                    setProperty("timeBarBG.y", screenHeight - 44 + (getProperty("timeTxt.height") / 4))
                    setProperty("timeBar.y", getProperty("timeBarBG.y") + 4)
                    setProperty("healthBarBG.y", 0.11 * screenHeight)
                    setProperty("healthBar.y", 0.11 * screenHeight + 4)
                    setProperty("scoreTxt.y", 0.11 * screenHeight + 36)
                    setProperty("iconP1.y", getProperty("healthBar.y") - 75)
                    setProperty("iconP2.y", getProperty("healthBar.y") - 75)
                    setProperty("botplayTxt.y", getProperty("timeBarBG.y") - 78)
                end
            end
        end

        if curBeat % 1 == 0 then
            if doNum == 1 then
                doNum = 2
            elseif doNum == 2 then
                doNum = 3
            elseif doNum == 3 then
                doNum = 4
            elseif doNum == 4 then
                doNum = 1
            end
        end
    end

    if curBeat == 124 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 1.25/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 127 then
        beatEffect = true
        sideMoveEffect = true
        changeScroll = true
        shakeEffect = true
    end

    if curBeat == 128 then
        slowEffect = false
        setProperty('defaultCamHUDZoom', 0.9)
        for i = 0,3 do
            if downscroll then
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0-520);
            else
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0+520);
            end
        end
    end

    if curBeat == 190 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    
    if curBeat == 251 then
        beatEffect = false
        sideMoveEffect = false
        changeScroll = false

        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0-35, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1-17.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2+17.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3+35, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 1.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote0Alpha', 0, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 255 then
        shakeEffect = false
    end

    if curBeat == 256 then
        mediumEffect = true
        for i = 0,3 do
            if downscroll then
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
            else
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
            end
            setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0);
        end
    end

    if curBeat == 263 or curBeat == 279 or curBeat == 295 or curBeat == 311 or curBeat == 327 or curBeat == 343 or curBeat == 359 or curBeat == 375 then
        doTweenX('camHUDX', 'camHUD', 75, 0.25/getProperty('playbackRate'), 'circIn')
    end
    if curBeat == 264 or curBeat == 280 or curBeat == 296 or curBeat == 312 or curBeat == 328 or curBeat == 344 or curBeat == 360 or curBeat == 376 then
        doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 271 or curBeat == 287 or curBeat == 303 or curBeat == 319 or curBeat == 335 or curBeat == 351 or curBeat == 367 then
        doTweenX('camHUDX', 'camHUD', -75, 0.25/getProperty('playbackRate'), 'circIn')
    end
    if curBeat == 272 or curBeat == 288 or curBeat == 304 or curBeat == 320 or curBeat == 336 or curBeat == 352 or curBeat == 368 then
        doTweenX('camHUDX', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
    end

    if curBeat == 320 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 380 then
        setProperty('defaultCamHUDZoom', 1.15)
    end

    if curBeat == 384 then
        setProperty('defaultCamHUDZoom', 0.9)

        mediumEffect = false
        slowEffect = true
        doXthing = false
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3);
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX0);
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
        cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
    end
    if curBeat == 385 or curBeat == 393 or curBeat == 401 or curBeat == 409 or curBeat == 417 or curBeat == 425 or curBeat == 433 or curBeat == 441 or curBeat == 449 or curBeat == 457 or curBeat == 465 or curBeat == 473 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX1);
        cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
        cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
    end
    if curBeat == 386 or curBeat == 394 or curBeat == 402 or curBeat == 410 or curBeat == 418 or curBeat == 426 or curBeat == 434 or curBeat == 442 or curBeat == 450 or curBeat == 458 or curBeat == 466 or curBeat == 474 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX2);
        cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
        cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
    end
    if curBeat == 387 or curBeat == 395 or curBeat == 403 or curBeat == 411 or curBeat == 419 or curBeat == 427 or curBeat == 435 or curBeat == 443 or curBeat == 451 or curBeat == 459 or curBeat == 467 or curBeat == 475 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
        cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
    end
    if curBeat == 392 or curBeat == 400 or curBeat == 408 or curBeat == 416 or curBeat == 424 or curBeat == 432 or curBeat == 440 or curBeat == 448 or curBeat == 456 or curBeat == 464 or curBeat == 472 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX0);
        cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
        cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
    end
    if curBeat == 478 then
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 0.75/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 0.75/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 479 then
        shakeEffect = true
    end
    if curBeat == 480 then
        setProperty('defaultCamHUDZoom', 1)
        doXthing = true
    end

    if curBeat == 508 then
        setProperty('defaultCamHUDZoom', 1.15)
    end

    if curBeat == 511 then
        beatEffect = true
        sideMoveEffect = true
        changeScroll = true
    end
    if curBeat == 512 then
        slowEffect = false
        setProperty('defaultCamHUDZoom', 0.9)
        for i = 0,3 do
            if downscroll then
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0-520);
            else
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0+520);
            end
        end
    end

    if curBeat == 574 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    
    if curBeat == 635 then
        beatEffect = false
        sideMoveEffect = false
        changeScroll = false

        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0-25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1-12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2+12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3+25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+12.25, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+25, 1.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote0Alpha', 0, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 640 then
        mediumEffect = true
        for i = 0,3 do
            if downscroll then
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
            else
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
            end
            setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0);
        end
    end
    if curBeat == 703 then
        shakeEffect = false
    end
    if curBeat == 704 then
        mediumEffect = false
        slowEffect = true
    end
    if curBeat == 768 then
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 2.5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.5, 5/getProperty('playbackRate'), 'sineOut')
    end
end
