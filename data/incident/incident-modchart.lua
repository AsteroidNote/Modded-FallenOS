local noteEffect = false
local noteXing = true
local noteAngling = false
local noteSpeed = 2
local noteMoveNum = 15
local noteAngleNum = 5
local noteXStrum = 0
local noteYStrum = 0
local hudMoveNum = 8
local hudMoving = false
local opponentCopyPlayer = false
local skippedNoteIntro = false
local showNotes = false
local herEffect = false
local moveNum = 6
local currentSwitch = 1
function onCreate()
    if downscroll then
        noteYStrum = screenHeight - 150
    else
        noteYStrum = 50
    end
    setProperty('skipArrowStartTween', true) -- really good thing
end

function onCreatePost()
    for i = 0,7 do
        noteTweenAlpha('playerNoteAlpha'..i, i, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    end
end

function onUpdate(elapsed)
    beat = (getSongPosition()/1000) * (bpm / 60)

    if noteEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', noteYStrum - (noteMoveNum/2) * math.cos((beat/noteSpeed + i*0.25) * math.pi))
            if noteXing then
                setPropertyFromGroup('strumLineNotes', 4, 'x', (defaultPlayerStrumX0 + noteXStrum) - noteMoveNum * math.cos((beat/(noteSpeed*2) + 4*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 5, 'x', (defaultPlayerStrumX1 + noteXStrum) - noteMoveNum * math.cos((beat/(noteSpeed*2) + 5*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 6, 'x', (defaultPlayerStrumX2 + noteXStrum) - noteMoveNum * math.cos((beat/(noteSpeed*2) + 6*0.25) * math.pi))
                setPropertyFromGroup('strumLineNotes', 7, 'x', (defaultPlayerStrumX3 + noteXStrum) - noteMoveNum * math.cos((beat/(noteSpeed*2) + 7*0.25) * math.pi))
            end
            if noteAngling then
                setPropertyFromGroup('strumLineNotes', i, 'direction', 90 - math.cos((beat/(noteSpeed*2) + i*0.25) * math.pi) * noteAngleNum)
                setPropertyFromGroup('strumLineNotes', i, 'angle', -(noteAngleNum*2) * math.cos((beat/(noteSpeed*2) + i*0.25) * math.pi))
            end
        end

        if hudMoving then
            setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi)/(hudMoveNum))*5)
        end

        if opponentCopyPlayer then
            for i = 0,3 do 
                setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i+4, 'y'))
                if noteXing then
                    setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i+4, 'x')-15)
                    setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i+4, 'x')-12.5)
                    setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i+4, 'x')+12.5)
                    setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i+4, 'x')+15)
                end
                if noteAngling then
                    setPropertyFromGroup('strumLineNotes', i, 'direction', getPropertyFromGroup('strumLineNotes', i+4, 'direction'))
                    setPropertyFromGroup('strumLineNotes', i, 'angle', getPropertyFromGroup('strumLineNotes', i+4, 'angle'))
                end
            end
        end
    end

    if herEffect == true then -- funny reference
        for i = 0,7 do
            setPropertyFromGroup("strumLineNotes",i,"x",getPropertyFromGroup("strumLineNotes",i,"x") + ((60/bpm)*moveNum)*getProperty('playbackRate'))
            if moveNum > 0 then
                if getPropertyFromGroup("strumLineNotes",i,"x") > 1225 then 
                    setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") - 1420))
                end
            elseif moveNum < 0 then
                if getPropertyFromGroup("strumLineNotes",i,"x") < -120 then
                    setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") + 1420))
                end
            end
        end
        setProperty('camGame.angle', math.sin(((getSongPosition()/crochet)*math.pi)/8)*5)
        setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi)/8)*5)
    end

    if skippedNoteIntro == true then
        if showNotes == false then
            for i = 4,7 do
                noteTweenAlpha('playerNoteAlpha'..i, i, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
                setPropertyFromGroup('strumLineNotes', i, 'y', noteYStrum)
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
            end
            setProperty('defaultCamHUDZoom', 0.9)
            noteEffect = false
            showNotes = true
        end
    end
end

function onSongStart()
	setProperty('songLength', 138000) --fake songLength, in milliseconds
    noteEffect = true
end

function doScrollSwitch()
    if currentSwitch == 2 then
        if downscroll then
            for i = 0,7 do
                noteYStrum = screenHeight - 150
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
            for i = 0,7 do
                noteYStrum = 50
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
        currentSwitch = 1
    elseif currentSwitch == 1 then
        if downscroll then
            for i = 0,7 do
                noteYStrum = 50
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
                setPropertyFromGroup('strumLineNotes', i, 'y', 50);
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
            for i = 0,7 do
                noteYStrum = screenHeight - 150
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'y', screenHeight - 150);
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
        currentSwitch = 2
    end
end

function onStepHit()
    if curStep == 1790 then
        setProperty('songLength', songLength)
        noteEffect = true
        noteAngling = true
        hudMoving = true
    end

    if curStep == 916 or curStep == 940 or curStep == 992 or curStep == 1000 then
        doScrollSwitch()
    end
    if curStep == 1004 then
        if downscroll then
            for i = 0,7 do
                noteYStrum = screenHeight - 150
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
            for i = 0,7 do
                noteYStrum = 50
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
        currentSwitch = 1
    end
    if curStep == 952 or curStep == 970 or curStep == 978 then
        numLOL = 0
        anotherRANDOM = getRandomInt(1,4)
        if anotherRANDOM == 1 then
            numLOL = 150
        elseif anotherRANDOM == 2 then
            numLOL = -150
        elseif anotherRANDOM == 3 then
            numLOL = 75
        elseif anotherRANDOM == 4 then
            numLOL = -75
        end
        setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0+numLOL)
        setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1+numLOL)
        setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2+numLOL)
        setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3+numLOL)
    end
    if curStep == 958 or curStep == 974 or curStep == 988 then
        setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
        setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
        setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
        setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
    end

    -- im so sorry
    if curStep == 2312 or curStep == 2340 or curStep == 2376 or curStep == 2396 or curStep == 2416 or curStep == 2420 or curStep == 2440 or curStep == 2456 or curStep == 2480 or curStep == 2488 or curStep == 2510 or curStep == 2524 then
        doScrollSwitch()
    end

    if curStep == 2324 or curStep == 2330 or curStep == 2346 or curStep == 2354 or curStep == 2358 or curStep == 2362 or curStep == 2386 or curStep == 2392 or curStep == 2404 or curStep == 2408 or curStep == 2428 or curStep == 2444 or curStep == 2452 or curStep == 2464 or curStep == 2472 or curStep == 2484 or curStep == 2496 or curStep == 2500 or curStep == 2514 or curStep == 2524 or curStep == 2528 or curStep == 2536 then
        if moveNum == 6 then
            moveNum = -6
        elseif moveNum == -6 then
            moveNum = 6
        end
    end

    if curStep == 2544 then
        noteXStrum = 0
        if downscroll then
            for i = 0,7 do
                noteYStrum = screenHeight - 150
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
            for i = 0,7 do
                noteYStrum = 50
                setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0);
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
        currentSwitch = 1

        moveNum = -12
    end

end

local funkyBeatEffect = false
local beatEffect = false
local sideMoveEffect = false
local changeScroll = false
local doNum = 1
function onBeatHit()
    if funkyBeatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 5)
            setProperty('camHUD.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.9, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.zoom', 1.1)
            doTweenZoom('camGameZoom', 'camGame', 1, 1/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            end
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', -5)
            setProperty('camHUD.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.9, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.zoom', 1.1)
            doTweenZoom('camGameZoom', 'camGame', 1, 1/getProperty('playbackRate'), 'circOut')
            if downscroll then
                setProperty('camHUD.x', -25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            else
                setProperty('camHUD.x', 25)
                doTweenX('camHUDX', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            end
        end
    end

    if beatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 10)
            setProperty('camHUD.zoom', 1.15)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.75/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.angle', 10)
            setProperty('camGame.zoom', 1.25)
            doTweenAngle('camGameAngle', 'camGame', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1, 0.75/getProperty('playbackRate'), 'circOut')
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
            setProperty('camGame.angle', -10)
            setProperty('camGame.zoom', 1.25)
            doTweenAngle('camGameAngle', 'camGame', 0, 0.75/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1, 0.75/getProperty('playbackRate'), 'circOut')
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
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 + 300);
			setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 + 300);
			setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 + 300);
			setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 + 300);
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 - 300);
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 - 300);
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 - 300);
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 - 300);
            noteTweenX('playerNote0X', 0, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote1X', 1, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'circOut')
        end
        if curBeat % 4 == 0 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 300);
			setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 300);
			setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 300);
			setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 300);
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 300);
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 300);
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 300);
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 300);
            noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'circOut')
            noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end

    if changeScroll == true then
        if doNum == 1 or doNum == 4 then
            if curBeat % 1 == 0 then
                if downscroll then
                    for i = 0,7 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                        setPropertyFromGroup('playerStrums', i, 'y', defaultPlayerStrumY0);
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                        setPropertyFromGroup('opponentStrums', i, 'y', 50);
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
                    for i = 0,7 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                        setPropertyFromGroup('playerStrums', i, 'y', defaultPlayerStrumY0);
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                        setPropertyFromGroup('opponentStrums', i, 'y', screenHeight - 150);
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
                    for i = 0,7 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', false)
                        setPropertyFromGroup('playerStrums', i, 'y', 50);
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
                        setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0);
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
                    for i = 0,7 do
                        setPropertyFromGroup('playerStrums', i, 'downScroll', true)
                        setPropertyFromGroup('playerStrums', i, 'y', screenHeight - 150);
                        setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
                        setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0);
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

    if curBeat > 32 then
        if skippedNoteIntro == false then
            skippedNoteIntro = true
        end
    end
    if curBeat == 1 then
        noteTweenAlpha('playerNote4Alpha', 4, 1, 2/getProperty('playbackRate'), 'sineInOut')
    end
	if curBeat == 8 then
		noteTweenAlpha('playerNote5Alpha', 5, 1, 2/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 16 then
		noteTweenAlpha('playerNote6Alpha', 6, 1, 2/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 24 then
		noteTweenAlpha('playerNote7Alpha', 7, 1, 2/getProperty('playbackRate'), 'sineInOut')
	end
    if curBeat == 31 then
        showNotes = true
    end
    if curBeat == 56 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 4.25/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 60 then
        noteXing = false
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 1.3/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 63 then
        funkyBeatEffect = true
    end
    if curBeat == 64 then
        noteEffect = false
        noteXing = true
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', noteYStrum)
        end
        setProperty('defaultCamHUDZoom', 0.9)
    end
    if curBeat == 71 or curBeat == 95 or curBeat == 111 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 79 or curBeat == 103 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 87 or curBeat == 119 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 123 then
        funkyBeatEffect = false
    end
    if curBeat == 124 then
        doTweenZoom('camHUDZoom', 'camHUD', 1.1, 1.25/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 1.25/getProperty('playbackRate'), 'sineOut')
        doTweenAngle('camHUDAngle', 'camHUD', -12.25, 1.25/getProperty('playbackRate'), 'sineOut')
		doTweenAngle('camGameAngle', 'camGame', -12.25, 1.25/getProperty('playbackRate'), 'sineOut')
    end
    if curBeat == 127 then
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
        noteTweenAlpha('playerNote0Alpha', 0, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        funkyBeatEffect = true
    end
    if curBeat == 128 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 135 or curBeat == 159 or curBeat == 175 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 143 or curBeat == 167 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 151 or curBeat == 183 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 188 then
        -- opponent
        noteTweenAlpha('playerNote0Alpha', 0, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 191 then
        funkyBeatEffect = false
    end
    if curBeat == 192 then
        setProperty('defaultCamHUDZoom', 1)
        doTweenZoom('camHUDZoom', 'camHUD', 1, 4/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 248 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 2.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 255 then
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
        noteTweenAlpha('playerNote0Alpha', 0, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        funkyBeatEffect = true
    end
    if curBeat == 256 then
        setProperty('defaultCamHUDZoom', 0.9)
    end

    if curBeat == 263 or curBeat == 287 or curBeat == 303 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 271 or curBeat == 295 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 279 or curBeat == 311 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 316 then
        -- opponent
        noteTweenAlpha('playerNote0Alpha', 0, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 319 then
        funkyBeatEffect = false
        beatEffect = true
        sideMoveEffect = true
        changeScroll = true
    end
    if curBeat == 320 then
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
    if curBeat == 350 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 379 then
        beatEffect = false
        sideMoveEffect = false
        changeScroll = false

        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 1.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote0Alpha', 0, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 384 then
        for i = 0,3 do
            if downscroll then
                setPropertyFromGroup('opponentStrums', i, 'downScroll', true)
            else
                setPropertyFromGroup('opponentStrums', i, 'downScroll', false)
            end
            setPropertyFromGroup('opponentStrums', i, 'y', defaultPlayerStrumY0);
        end
    end
    

    if curBeat == 508 then
        noteXing = false
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
        noteTweenAlpha('playerNote0Alpha', 0, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 1, 2/getProperty('playbackRate'), 'sineInOut')
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-360, 1.3/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+360, 1.3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+360, 1.3/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 512 then
        noteEffect = false
        for i = 0,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', noteYStrum)
            setPropertyFromGroup('strumLineNotes', i, 'direction', 90)
            setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
        end
        herEffect = true
    end

    if curBeat == 632 then
        doTweenZoom('camHUDZoom', 'camHUD', 1, 2.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 638 then
        noteTweenAlpha('playerNote0Alpha', 0, 0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0, 1/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 640 then
        setProperty('defaultCamHUDZoom', 1)
        doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'sineInOut')
        herEffect = false
        moveNum = 4
        noteEffect = true
        noteXing = false
        noteAngling = true
        hudMoving = true
        noteAngleNum = 2.5
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-15, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-12.5, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+12.5, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+15, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'circOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'circOut')
    end
    if curBeat == 671 then
        opponentCopyPlayer = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0.75, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 679 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 687 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 695 then
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+225, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 700 then
        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 1.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 1.5/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote0Alpha', 0, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1.5/getProperty('playbackRate'), 'sineInOut')

        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 1.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 704 then
        setProperty('defaultCamHUDZoom', 0.9)
        noteAngling = false
        hudMoving = false
        noteXing = true
        for i = 0,7 do 
            noteTweenDirection('noteRotate'..i, i, 90, 1/getProperty('playbackRate'), 'circOut')
            noteTweenAngle('noteAngle'..i, i, 0, 1/getProperty('playbackRate'), 'circOut')
        end
        doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat >= 736 and curBeat < 768 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.25, 15/getProperty('playbackRate'), nothing)
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 10/getProperty('playbackRate'), nothing)
    end
    if curBeat == 768 then
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 2/getProperty('playbackRate'), 'sineInOut')
    end
end