local angleEffect = false
local rotateStep = 2
local sideMoveEffect = false
local slowMovingEffect = false
local noteAngle = 0
function onStepHit()
    if sideMoveEffect == true then
        if curStep % 4 == 0 then
            setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 + 321);
			setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 + 321);
			setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 + 321);
			setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 + 321);
            setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 - 321);
			setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 - 321);
			setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 - 321);
			setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 - 321);
        end
        if curStep % 8 == 0 then
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
    if angleEffect == true then
        if curStep % rotateStep == 0 then
            noteAngle = noteAngle + 22.5
            setPropertyFromGroup('playerStrums', 0, 'angle', noteAngle);
			setPropertyFromGroup('playerStrums', 1, 'angle', noteAngle);
			setPropertyFromGroup('playerStrums', 2, 'angle', noteAngle);
			setPropertyFromGroup('playerStrums', 3, 'angle', noteAngle);
            setPropertyFromGroup('opponentStrums', 0, 'angle', noteAngle);
			setPropertyFromGroup('opponentStrums', 1, 'angle', noteAngle);
			setPropertyFromGroup('opponentStrums', 2, 'angle', noteAngle);
			setPropertyFromGroup('opponentStrums', 3, 'angle', noteAngle);
        end
    end
end

function onUpdatePost(elapsed)
    if noteAngle == 360 then
        noteAngle = 0
    end
end

function onCreate()
    setProperty('skipArrowStartTween', true) -- really good thing
end

function onCreatePost()
    -- this is for intro
    setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0-50);
    setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1-25);
    setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2+25);
    setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3+50);
    noteTweenAngle('playerNote4Angle', 4, noteAngle+180, 0.001, 'sineInOut')
    noteTweenAngle('playerNote5Angle', 5, noteAngle+180, 0.001, 'sineInOut')
    noteTweenAngle('playerNote6Angle', 6, noteAngle-180, 0.001, 'sineInOut')
    noteTweenAngle('playerNote7Angle', 7, noteAngle-180, 0.001, 'sineInOut')
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
    noteTweenAlpha('playerNote0Alpha', 0, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote1Alpha', 1, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote2Alpha', 2, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote3Alpha', 3, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote4Alpha', 4, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote5Alpha', 5, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote6Alpha', 6, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
    noteTweenAlpha('playerNote7Alpha', 7, 0, 0.005/getProperty('playbackRate'), 'sineInOut')
end

function onSongStart()
    doTweenAlpha('camHUDA', 'camHUD', 1, 10/getProperty('playbackRate'), 'sineInOut')
end

function onBeatHit()
	if curBeat == 64 then
		noteTweenAlpha('playerNote4Alpha', 4, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 4, defaultPlayerStrumX0, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote0Y', 4, defaultPlayerStrumY0, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote4Angle', 4, noteAngle, 4/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 80 then
		noteTweenAlpha('playerNote5Alpha', 5, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 5, defaultPlayerStrumX1, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote1Y', 5, defaultPlayerStrumY1, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote5Angle', 5, noteAngle, 4/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 96 then
		noteTweenAlpha('playerNote6Alpha', 6, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 6, defaultPlayerStrumX2, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote2Y', 6, defaultPlayerStrumY2, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote6Angle', 6, noteAngle, 4/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 112 then
		noteTweenAlpha('playerNote7Alpha', 7, 1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 7, defaultPlayerStrumX3, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote3Y', 7, defaultPlayerStrumY3, 4/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('playerNote7Angle', 7, noteAngle, 4/getProperty('playbackRate'), 'sineInOut')
	end
    if curBeat == 124 then -- incase if it was skipped
        cancelTween('camHUDA')
        setProperty('camHUD.alpha', 1)
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote4Alpha', 4, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote5Alpha', 5, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote6Alpha', 6, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote7Alpha', 7, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3);
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX3);
        setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumY0);
        setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumY1);
        setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumY2);
        setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumY3);
        setPropertyFromGroup('opponentStrums', 0, 'y', defaultOpponentStrumY0);
        setPropertyFromGroup('opponentStrums', 1, 'y', defaultOpponentStrumY1);
        setPropertyFromGroup('opponentStrums', 2, 'y', defaultOpponentStrumY2);
        setPropertyFromGroup('opponentStrums', 3, 'y', defaultOpponentStrumY3);
        noteTweenAngle('playerNote0Angle', 0, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote1Angle', 1, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote2Angle', 2, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote3Angle', 3, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote4Angle', 4, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote5Angle', 5, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote6Angle', 6, noteAngle, 0.001, 'sineInOut')
        noteTweenAngle('playerNote7Angle', 7, noteAngle, 0.001, 'sineInOut')
    end
    if curBeat == 128 then
        angleEffect = true
    end
    if curBeat == 192 then
		noteTweenX('playerNote0X', 0, defaultPlayerStrumX0, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3, 6/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 254 then
        rotateStep = 1
		noteTweenAlpha('playerNote0Alpha', 0, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 1/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote0X', 0, defaultOpponentStrumX0, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultOpponentStrumX1, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultOpponentStrumX2, 2/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultOpponentStrumX3, 2/getProperty('playbackRate'), 'sineInOut')
	end

    if curBeat == 256 then
        rotateStep = 2
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 3/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 264 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 280 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 296 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 312 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 328 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 344 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2-225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 360 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+225, 6/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+225, 6/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 376 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 3/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 3/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 382 then
        rotateStep = 1
    end
    if curBeat == 384 then
        rotateStep = 2
    end

    if curBeat == 444 then
        angleEffect = false
        for i = 0,7 do
            noteTweenAngle('playerNoteAngle'..i, i, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
    end
    if curBeat == 448 then
        sideMoveEffect = true
        angleEffect = true
    end
    if curBeat == 510 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 510 then
        sideMoveEffect = false
    end
    if curBeat == 512 then
        sideMoveEffect = true
    end
    if curBeat == 574 then
        sideMoveEffect = false
        angleEffect = false
        for i = 0,7 do
            noteTweenAngle('playerNoteAngle'..i, i, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        end
        noteTweenX('playerNote0X', 0, defaultOpponentStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultOpponentStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultOpponentStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultOpponentStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 640 then
		noteTweenAlpha('playerNote4Alpha', 4, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote5Alpha', 5, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote6Alpha', 6, 0, 2/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote7Alpha', 7, 0, 5/getProperty('playbackRate'), 'sineInOut')
	end
	if curBeat == 648 then
		noteTweenAlpha('playerNote7Alpha', 7, 0, 1/getProperty('playbackRate'), 'sineInOut')
	end
end