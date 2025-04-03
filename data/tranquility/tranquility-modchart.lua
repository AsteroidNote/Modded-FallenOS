function onCreate()
    setProperty('skipArrowStartTween', true) -- really good thing
end

function onCreatePost()
    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
    for i = 0,7 do
        noteTweenAlpha('playerNoteAlpha'..i, i, 0, 0.001/getProperty('playbackRate'), 'sineInOut')
    end
    setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0-50);
    setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1-25);
    setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2+25);
    setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3+50);
    noteTweenAngle('playerNote4Angle', 4, 90, 0.001, 'sineInOut')
    noteTweenAngle('playerNote5Angle', 5, 90, 0.001, 'sineInOut')
    noteTweenAngle('playerNote6Angle', 6, -90, 0.001, 'sineInOut')
    noteTweenAngle('playerNote7Angle', 7, -90, 0.001, 'sineInOut')
    if downscroll then
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0-25);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1-70);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2-50);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3-25);
    else
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0+25);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1+70);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2+50);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3+25);
    end
end

function onCountdownTick(swagCounter)
	if swagCounter == 0 then
		noteTweenAlpha('playerNote4Alpha', 4, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 4, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote0Y', 4, defaultPlayerStrumY0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote4Angle', 4, 0, 1/getProperty('playbackRate'), 'sineInOut')
	end
	if swagCounter == 1 then
		noteTweenAlpha('playerNote5Alpha', 5, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 5, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote1Y', 5, defaultPlayerStrumY1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote5Angle', 5, 0, 1/getProperty('playbackRate'), 'sineInOut')
	end
	if swagCounter == 2 then
		noteTweenAlpha('playerNote6Alpha', 6, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 6, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote2Y', 6, defaultPlayerStrumY2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote6Angle', 6, 0, 1/getProperty('playbackRate'), 'sineInOut')
	end
	if swagCounter == 3 then
		noteTweenAlpha('playerNote7Alpha', 7, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 7, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote3Y', 7, defaultPlayerStrumY3, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote7Angle', 7, 0, 1/getProperty('playbackRate'), 'sineInOut')
	end
end

local slowEffect = false
function onUpdate(elapsed)
    -- note effect recreation ig
    beat = (getSongPosition()/1000) * (bpm / 60)
    if slowEffect == true then
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            --setProperty('camHUD.flashSprite.scaleY' , math.sin(((getSongPosition()/crochet)*math.pi)/8)*1)
            --setProperty('camHUD.flashSprite.scaleX' , math.sin(((getSongPosition()/crochet)*math.pi)/2)*1)
            --setPropertyFromGroup('strumLineNotes', i, 'direction', 90 - math.cos((beat/2 + i*0.25) * math.pi))
            --setPropertyFromGroup('strumLineNotes', i, 'angle', -10 * math.cos((beat/2 + i*0.25) * math.pi))
        end
    end

    if cursedEffect == true then -- this is chaos, use at own risk
        for i = 4,7 do 
            setPropertyFromGroup('strumLineNotes', i-4, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY0 + 12.5 * math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'direction', 90 - math.cos((beat/2 + i*0.25) * math.pi))
            setPropertyFromGroup('strumLineNotes', i, 'angle', -10 * math.cos((beat/2 + i*0.25) * math.pi))
            setProperty('camHUD.x', math.sin(((getSongPosition()/crochet)*math.pi)/8)*50)
            setProperty('camHUD.zoom', 1 + math.sin(((getSongPosition()/crochet)*math.pi)/4) * 0.25)
            setProperty('camHUD.angle', math.sin(((getSongPosition()/crochet)*math.pi)/16)*360)
        end
    end
end

function onSongStart()
    slowEffect = true
end


local noteBounceEffect = false
function onBeatHit()
    if noteBounceEffect == true then
        if curBeat % 1 == 0 then
            for i = 0,7 do
                noteTweenDirection('noteDirection'..i, i, 105, 0.75/getProperty('playbackRate'), 'sineInOut')
            end
        end
        if curBeat % 2 == 0 then
            for i = 0,7 do
                noteTweenDirection('noteDirection'..i, i, 75, 0.75/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end

    if curBeat == 124 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+321, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 188 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0.15, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.15, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.15, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.15, 1/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 191 then
        noteBounceEffect = true
    end
    if curBeat == 224 then
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-32, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-16, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+16, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+32, 1/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 255 then
        noteBounceEffect = false
        for i = 0,7 do
            noteTweenDirection('noteDirection'..i, i, 90, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 252 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.5, 2/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-321, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-321, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 316 then
        -- opponent
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 2/getProperty('playbackRate'), 'sineInOut')
        -- player
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 2/getProperty('playbackRate'), 'sineInOut')
    end

    -- the ending
    if curBeat == 400 then
        noteTweenAngle('playerNote4Angle', 4, 90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote5Angle', 5, 90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote6Angle', 6, -90, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote7Angle', 7, -90, 1/getProperty('playbackRate'), 'sineInOut')

		noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-50, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-25, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+25, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+50, 1/getProperty('playbackRate'), 'sineInOut')

        noteTweenAlpha('playerNote4Alpha', 4, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote5Alpha', 5, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote6Alpha', 6, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote7Alpha', 7, 0, 1/getProperty('playbackRate'), 'sineInOut')

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

    if curBeat == 404 then
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
    end
    
    -- gas thing
    if curBeat == 100 or curBeat == 108 or curBeat == 116 or curBeat == 124 or curBeat == 132 or curBeat == 140 or curBeat == 148 or curBeat == 156 or curBeat == 164 or curBeat == 172 or curBeat == 180 or curBeat == 188 then
        for i = 0,7 do
            noteTweenAngle('playerNoteAngle'..i, i, 360, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 196 or curBeat == 204 or curBeat == 212 or curBeat == 220 or curBeat == 228 or curBeat == 236 or curBeat == 244 or curBeat == 252 or curBeat == 260 or curBeat == 268 or curBeat == 276 or curBeat == 284 then
        for i = 0,7 do
            noteTweenAngle('playerNoteAngle'..i, i, 360, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 292 or curBeat == 300 or curBeat == 308 or curBeat == 316 then
        for i = 0,7 do
            noteTweenAngle('playerNoteAngle'..i, i, 360, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
end

function onTweenCompleted(tag)
    for i = 0,7 do
        if tag == 'playerNoteAngle'..i then
            noteTweenAngle('playerNoteAngleEnd'..i, i, 0, 0.001/getProperty('playbackRate'), 'sineInOut')
        end
    end
end