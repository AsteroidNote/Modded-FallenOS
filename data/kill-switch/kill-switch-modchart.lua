function onCreatePost()
    noteTweenAlpha('playerNote4Alpha', 4, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote5Alpha', 5, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote6Alpha', 6, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote7Alpha', 7, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
end

function onCreate()
    setProperty('skipArrowStartTween', true) -- really good thing
end

local skippedNoteIntro = false
local showNotes = false
local bounceEffect = false
local moveEffect = false
local returnToNormal = false
local directionEffect = false
local numSpeed = 1
local numDiraction = 5
function onUpdate(elapsed)
    beat = (getSongPosition()/1000) * (bpm / 60)
    if moveEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0 - 10 + 15 * math.cos((beat/4 + 4*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1 - 0 + 15 * math.cos((beat/4 + 5*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2 + 0 + 15 * math.cos((beat/4 + 6*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3 + 10 + 15 * math.cos((beat/4 + 7*0.25) * math.pi))
            returnToNormal = true
        end
    else
        if returnToNormal == true then
            for i = 4,7 do 
                setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0)
                setPropertyFromGroup('strumLineNotes', 4, 'x', defaultPlayerStrumX0)
                setPropertyFromGroup('strumLineNotes', 5, 'x', defaultPlayerStrumX1)
                setPropertyFromGroup('strumLineNotes', 6, 'x', defaultPlayerStrumX2)
                setPropertyFromGroup('strumLineNotes', 7, 'x', defaultPlayerStrumX3)
                returnToNormal = false
            end
        end
    end

    setPropertyFromGroup('opponentStrums', 0, 'x', getPropertyFromGroup('playerStrums', 0, 'x') -15);
    setPropertyFromGroup('opponentStrums', 1, 'x', getPropertyFromGroup('playerStrums', 1, 'x') -12.5);
    setPropertyFromGroup('opponentStrums', 2, 'x', getPropertyFromGroup('playerStrums', 2, 'x') +12.5);
    setPropertyFromGroup('opponentStrums', 3, 'x', getPropertyFromGroup('playerStrums', 3, 'x') +15);
    setPropertyFromGroup('opponentStrums', 0, 'y', getPropertyFromGroup('playerStrums', 0, 'y'));
    setPropertyFromGroup('opponentStrums', 1, 'y', getPropertyFromGroup('playerStrums', 1, 'y'));
    setPropertyFromGroup('opponentStrums', 2, 'y', getPropertyFromGroup('playerStrums', 2, 'y'));
    setPropertyFromGroup('opponentStrums', 3, 'y', getPropertyFromGroup('playerStrums', 3, 'y'));

    if bounceEffect == true then
        for i = 0, 3 do
            if i % 2 == 0 then
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.7 - math.sin((getSongPosition()/crochet)*math.pi) * 0.25) -- so it does switch easily
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.7 - math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('opponentStrums', i, 'direction', 90 - math.sin((getSongPosition()/crochet)*math.pi) * 5)
                setPropertyFromGroup('opponentStrums', i, 'angle', -10 * math.sin((getSongPosition()/crochet)*math.pi))
            else
                setPropertyFromGroup('opponentStrums', i, 'scale.x', 0.7 + math.sin((getSongPosition()/crochet)*math.pi) * 0.25) -- so it does switch easily
                setPropertyFromGroup('opponentStrums', i, 'scale.y', 0.7 + math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('opponentStrums', i, 'direction', 90 + math.sin((getSongPosition()/crochet)*math.pi) * 5)
                setPropertyFromGroup('opponentStrums', i, 'angle', 10 * math.sin((getSongPosition()/crochet)*math.pi))
            end
        end

        for i = 0, 3 do
            if i % 2 == 1 then
                setPropertyFromGroup('playerStrums', i, 'scale.x', 0.7 + math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 0.7 + math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('playerStrums', i, 'direction', 90 + math.sin((getSongPosition()/crochet)*math.pi) * 5)
                setPropertyFromGroup('playerStrums', i, 'angle', 10 * math.sin((getSongPosition()/crochet)*math.pi))
            else
                setPropertyFromGroup('playerStrums', i, 'scale.x', 0.7 - math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('playerStrums', i, 'scale.y', 0.7 - math.sin((getSongPosition()/crochet)*math.pi) * 0.25)
                setPropertyFromGroup('playerStrums', i, 'direction', 90 - math.sin((getSongPosition()/crochet)*math.pi) * 5)
                setPropertyFromGroup('playerStrums', i, 'angle', -10 * math.sin((getSongPosition()/crochet)*math.pi))
            end
        end
    end

    if directionEffect == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'direction', 90 - math.sin((getSongPosition()/crochet)*math.pi/numSpeed) * numDirection)
        end
    end

    if skippedNoteIntro == true then
        if showNotes == false then
            noteTweenAlpha('playerNote4Alpha', 4, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
            noteTweenAlpha('playerNote5Alpha', 5, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
            noteTweenAlpha('playerNote6Alpha', 6, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
            noteTweenAlpha('playerNote7Alpha', 7, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
            showNotes = true
        end
    end

    -- I want to thank Hazard for figuring this out, despite the fact she d-doesn't know lua... AMAZING!!!
    for i = 0, getProperty('notes.length')-1 do
        setPropertyFromGroup('notes', i, 'scale.x', getPropertyFromGroup('strumLineNotes', getPropertyFromGroup('notes', i, 'noteData'), 'scale.x'))
        if getPropertyFromGroup('notes', i, 'isSustainNote') == false then
            setPropertyFromGroup('notes', i, 'scale.y', getPropertyFromGroup('strumLineNotes', getPropertyFromGroup('notes', i, 'noteData'), 'scale.x'))
        end
    end
end

function onSongStart()
    noteTweenAlpha('playerNote4Alpha', 4, 1, 1/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote7Alpha', 7, 1, 1/getProperty('playbackRate'), 'sineInOut')
end

function onStepHit()
    if curStep == 1648 or curStep == 1776 then
        setProperty('camHUD.zoom', 0.7)
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.9)
        doTweenZoom('camGameZoom', 'camGame', 1, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -40)
            doTweenY('camHUDY', 'camHUD', -20, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 40)
            doTweenY('camHUDY', 'camHUD', 20, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1651 or curStep == 1779 then
        setProperty('camHUD.zoom', 0.65)
        doTweenZoom('camHUDZoom', 'camHUD', 0.8, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.85)
        doTweenZoom('camGameZoom', 'camGame', 0.95, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -60)
            doTweenY('camHUDY', 'camHUD', -40, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 60)
            doTweenY('camHUDY', 'camHUD', 40, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1654 or curStep == 1782 then
        setProperty('camHUD.zoom', 0.6)
        doTweenZoom('camHUDZoom', 'camHUD', 0.75, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.8)
        doTweenZoom('camGameZoom', 'camGame', 0.9, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -80)
            doTweenY('camHUDY', 'camHUD', -60, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 80)
            doTweenY('camHUDY', 'camHUD', 60, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1656 or curStep == 1784 then
        setProperty('camHUD.zoom', 0.6)
        doTweenZoom('camHUDZoom', 'camHUD', 0.75, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.8)
        doTweenZoom('camGameZoom', 'camGame', 0.9, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -80)
            doTweenY('camHUDY', 'camHUD', -60, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 80)
            doTweenY('camHUDY', 'camHUD', 60, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1659 or curStep == 1787 then
        setProperty('camHUD.zoom', 0.75)
        doTweenZoom('camHUDZoom', 'camHUD', 0.8, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.85)
        doTweenZoom('camGameZoom', 'camGame', 0.95, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -60)
            doTweenY('camHUDY', 'camHUD', -40, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 60)
            doTweenY('camHUDY', 'camHUD', 40, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1662 or curStep == 1790 then
        setProperty('camHUD.zoom', 0.7)
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.9)
        doTweenZoom('camGameZoom', 'camGame', 1, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -40)
            doTweenY('camHUDY', 'camHUD', -20, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 40)
            doTweenY('camHUDY', 'camHUD', 20, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1664 or curStep == 1792 then
        if downscroll then
            setProperty('camHUD.y', -5)
        else
            setProperty('camHUD.y', 5)
        end
        doTweenY('camHUDY', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
    end
    
    if curStep == 1712 or curStep == 1840 then
        setProperty('camHUD.zoom', 0.7)
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.9)
        doTweenZoom('camGameZoom', 'camGame', 1, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -40)
            doTweenY('camHUDY', 'camHUD', -20, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 40)
            doTweenY('camHUDY', 'camHUD', 20, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1715 or curStep == 1843 then
        setProperty('camHUD.zoom', 0.65)
        doTweenZoom('camHUDZoom', 'camHUD', 0.8, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.85)
        doTweenZoom('camGameZoom', 'camGame', 0.95, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -60)
            doTweenY('camHUDY', 'camHUD', -40, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 60)
            doTweenY('camHUDY', 'camHUD', 40, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end
    if curStep == 1718 or curStep == 1846 then
        setProperty('camHUD.zoom', 0.6)
        doTweenZoom('camHUDZoom', 'camHUD', 0.75, 0.5/getProperty('playbackRate'), 'circOut')
        setProperty('camGame.zoom', 0.8)
        doTweenZoom('camGameZoom', 'camGame', 0.9, 0.5/getProperty('playbackRate'), 'circOut')
        if downscroll then
            setProperty('camHUD.y', -80)
            doTweenY('camHUDY', 'camHUD', -60, 0.5/getProperty('playbackRate'), 'circOut')
        else
            setProperty('camHUD.y', 80)
            doTweenY('camHUDY', 'camHUD', 60, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end

    if curStep == 68 or curStep == 76 or curStep == 84 or curStep == 88 or curStep == 92 or curStep == 100 or curStep == 108 or curStep == 112 or curStep == 116 or curStep == 120 then
        random = getRandomInt(1, 3)
        if random == 1 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX1);
            setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX2);
            setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX3);
            setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX0);
        elseif random == 2 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX2);
            setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX3);
            setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX0);
            setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX1);
        elseif random == 3 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX3);
            setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX0);
            setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX1);
            setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX2);
        end
        setPropertyFromGroup('playerStrums', 0, 'angle', getRandomFloat(-180, 180));
        setPropertyFromGroup('playerStrums', 1, 'angle', getRandomFloat(-180, 180));
        setPropertyFromGroup('playerStrums', 2, 'angle', getRandomFloat(-180, 180));
        setPropertyFromGroup('playerStrums', 3, 'angle', getRandomFloat(-180, 180));
    end 
    
    if curStep == 70 or curStep == 78 or curStep == 86 or curStep == 90 or curStep == 94 or curStep == 102 or curStep == 110 or curStep == 114 or curStep == 124 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 0, 'angle', 0);
        setPropertyFromGroup('playerStrums', 1, 'angle', 0);
        setPropertyFromGroup('playerStrums', 2, 'angle', 0);
        setPropertyFromGroup('playerStrums', 3, 'angle', 0);
    end

    if curStep == 160 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 0, 'angle', 180);
        setPropertyFromGroup('playerStrums', 1, 'angle', 180);
        setPropertyFromGroup('playerStrums', 2, 'angle', 180);
        setPropertyFromGroup('playerStrums', 3, 'angle', 180);
    end
    if curStep == 164 then
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('playerStrums', 0, 'angle', 0);
        setPropertyFromGroup('playerStrums', 1, 'angle', 0);
        setPropertyFromGroup('playerStrums', 2, 'angle', 0);
        setPropertyFromGroup('playerStrums', 3, 'angle', 0);
    end
end

local beatEffect = false
local hardZoomingEffect = false
local zoomingEffect = false
local introZoom = false
function onBeatHit()
    -- effects on beat
    if beatEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 5)
            setProperty('camHUD.zoom', 0.95)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.angle', 2.5)
            setProperty('camGame.zoom', 1.1)
            doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'circOut')
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
            setProperty('camHUD.angle', -2.5)
            setProperty('camHUD.zoom', 0.95)
            doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 0.85, 1/getProperty('playbackRate'), 'circOut')
            setProperty('camGame.angle', -2.5)
            setProperty('camGame.zoom', 1.1)
            doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'circOut')
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

    if zoomingEffect == true then
        if curBeat % 1 == 0 then
            setProperty('camHUD.angle', 0)
            setProperty('camGame.angle', 0)
            setProperty('camHUD.zoom', 0.85)
            setProperty('camGame.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', 15, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1.05, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenAngle('camGameAngle', 'camGame', 7.5, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1.15, 0.5/getProperty('playbackRate'), 'circOut')
        end
        if curBeat % 2 == 0 then
            setProperty('camHUD.angle', 0)
            setProperty('camGame.angle', 0)
            setProperty('camHUD.zoom', 0.85)
            setProperty('camGame.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', -15, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1.05, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenAngle('camGameAngle', 'camGame', -7.5, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1.15, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end

    if hardZoomingEffect == true then
        if curBeat % 1 == 0 then
            cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
            cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
            setProperty('camHUD.angle', 0)
            setProperty('camGame.angle', 0)
            setProperty('camHUD.zoom', 0.85)
            setProperty('camGame.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', 20, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1.15, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenAngle('camGameAngle', 'camGame', 10, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1.45, 0.5/getProperty('playbackRate'), 'circOut')
        end
        if curBeat % 2 == 0 then
            cameraShake('game', 0.0125, 0.1/getProperty('playbackRate'))
            cameraShake('hud', 0.0075, 0.1/getProperty('playbackRate'))
            setProperty('camHUD.angle', 0)
            setProperty('camGame.angle', 0)
            setProperty('camHUD.zoom', 0.85)
            setProperty('camGame.zoom', 1)
            doTweenAngle('camHUDAngle', 'camHUD', -20, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camHUDZoom', 'camHUD', 1.15, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenAngle('camGameAngle', 'camGame', -10, 0.5/getProperty('playbackRate'), 'circOut')
            doTweenZoom('camGameZoom', 'camGame', 1.45, 0.5/getProperty('playbackRate'), 'circOut')
        end
    end

    if curBeat == 8 then
        noteTweenAlpha('playerNote5Alpha', 5, 1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote6Alpha', 6, 1, 1/getProperty('playbackRate'), 'sineInOut')
    end
    
    if curBeat > 10 then
        if skippedNoteIntro == false then
            skippedNoteIntro = true
        end
    end

    -- modchart - beginning of the hell
    if curBeat == 48 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 6/getProperty('playbackRate'), 'sineInOut')
        if downscroll then
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
        else
            doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 40, 6/getProperty('playbackRate'), 'sineInOut')
    
            doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
            doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 40, 6/getProperty('playbackRate'), 'sineInOut')
        end
        introZoom = true
    end

    if curBeat == 66 or curBeat == 82 or curBeat == 98 or curBeat == 114 or curBeat == 130 or curBeat == 146 or curBeat == 162 or curBeat == 178 or curBeat == 192 or curBeat == 258 then
        bounceEffect = true
    end
    if curBeat == 81 or curBeat == 95 or curBeat == 113 or curBeat == 127 or curBeat == 145 or curBeat == 159 or curBeat == 177 or curBeat == 191 or curBeat == 257 then
        bounceEffect = false
    end

    if curBeat == 64 or curBeat == 96 or curBeat == 128 or curBeat == 160 then
        setProperty('defaultCamHUDZoom', 0.85)
        setProperty('camHUD.angle', -5)
        setProperty('camGame.angle', -5)
        runTimer('finishTHIS', 0.25/getProperty('playbackRate'))
    end
    if curBeat == 191 then
        beatEffect = true
    end
    if curBeat == 208 then
        setProperty('defaultCamHUDZoom', 0.9)
    end
    if curBeat == 216 then
        setProperty('defaultCamHUDZoom', 0.85)
    end

    if curBeat == 256 then
        beatEffect = false
        for i = 0,7 do
            noteTweenY('playerNoteY'..i, i, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'circOut')
        end
    end
    if curBeat == 257 then
        beatEffect = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 320 then
        setProperty('defaultCamHUDZoom', 0.85)
        bounceEffect = false
        beatEffect = false
        for i = 0,7 do
            noteTweenY('playerNoteY'..i, i, defaultPlayerStrumY0, 0.25/getProperty('playbackRate'), 'circOut')
        end
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')

        if introZoom then
            if downscroll then
                doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
        
                doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
            else
                doTweenY('scoreTxtY', 'scoreTxt', getProperty("scoreTxt.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('healthBarY', 'healthBar', getProperty("healthBar.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('healthBarBGY', 'healthBarBG', getProperty("healthBarBG.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('iconP1Y', 'iconP1', getProperty("iconP1.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('iconP2Y', 'iconP2', getProperty("iconP2.y") - 40, 3/getProperty('playbackRate'), 'sineInOut')
        
                doTweenY('timeBarY', 'timeBar', getProperty("timeBar.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('timeBarBGY', 'timeBarBG', getProperty("timeBarBG.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
                doTweenY('timeTxtY', 'timeTxt', getProperty("timeTxt.y") + 40, 3/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    if curBeat == 328 then
        directionEffect = true
        numDirection = 5
    end
    if curBeat == 332 then
        numDirection = 10
    end
    if curBeat == 334 then
        numDirection = 15
    end
    if curBeat == 336 then
        moveEffect = true
        directionEffect = false
        numDirection = 5
    end

    if curBeat == 335 or curBeat == 343 or curBeat == 351 or curBeat == 367 or curBeat == 375 or curBeat == 383 then
        hardZoomingEffect = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 339 or curBeat == 347 or curBeat == 355 or curBeat == 371 or curBeat == 379 or curBeat == 387 then
        hardZoomingEffect = false
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 340 or curBeat == 348 or curBeat == 356 or curBeat == 372 or curBeat == 380 or curBeat == 388 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 1/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 400 then
        moveEffect = false
    end

    if curBeat == 399 or curBeat == 415 or curBeat == 447 then
        zoomingEffect = true
    end

    if curBeat == 431 then
        zoomingEffect = true
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 411 or curBeat == 427 or curBeat == 443 or curBeat == 459 then
        zoomingEffect = false
    end

    if curBeat == 412 or curBeat == 428 or curBeat == 444 or curBeat == 460 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.5/getProperty('playbackRate'), 'circOut')
    end

    if curBeat == 430 or curBeat == 462 then
        doTweenAngle('camHUDAngle', 'camHUD', -25, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.25, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', -25, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 0.45, 1/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 432 or curBeat == 464 then
        setProperty('camHUD.y', 0)
        setProperty('camGame.y', 0)
        cancelTween('camHUDAngle')
        cancelTween('camGameAngle')
        cancelTween('camHUDZoom')
        cancelTween('camGameZoom')
        setProperty('camHUD.angle', 0)
        setProperty('camGame.angle', 0)
        setProperty('camHUD.zoom', 0.85)
        setProperty('camGame.zoom', 1)
        doTweenAngle('camHUDAngle', 'camHUD', -15, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.05, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenAngle('camGameAngle', 'camGame', -7.5, 0.5/getProperty('playbackRate'), 'circOut')
        doTweenZoom('camGameZoom', 'camGame', 1.15, 0.5/getProperty('playbackRate'), 'circOut')
    end

    if curBeat == 464 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.85, 0.75/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.75/getProperty('playbackRate'), 'sineInOut')

        noteTweenAngle('playerNote4Angle', 4, 90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote5Angle', 5, 90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote6Angle', 6, -90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote7Angle', 7, -90, 1/getProperty('playbackRate'), 'sineInOut')

		noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-50, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-25, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+25, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+50, 1/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')

		if downscroll then
			noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0-25, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1-70, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2-50, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3-25, 1/getProperty('playbackRate'), 'sineInOut')
		else
			noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0+25, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1+70, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2+50, 1/getProperty('playbackRate'), 'sineInOut')
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3+25, 1/getProperty('playbackRate'), 'sineInOut')
		end
    end
    
    if curBeat == 466 then
        noteTweenAlpha('playerNote4Alpha', 4, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote5Alpha', 5, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote6Alpha', 6, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote7Alpha', 7, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'finishTHIS' then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 1/getProperty('playbackRate'), 'sineInOut')
    end
end