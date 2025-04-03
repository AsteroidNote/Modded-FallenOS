function onCreatePost()
    setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 +15);
    setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 +12.5);
    setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 -12.5);
    setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 -15);
    setPropertyFromGroup('opponentStrums', 0, 'visible', false);
    setPropertyFromGroup('opponentStrums', 1, 'visible', false);
    setPropertyFromGroup('opponentStrums', 2, 'visible', false);
    setPropertyFromGroup('opponentStrums', 3, 'visible', false);
end

local allowBounce = true
function goodNoteHit(id, noteData, noteType, isSustainNote)
    if allowBounce and not isSustainNote then
        if downscroll then
            if noteData == 0 then
                noteTweenY("NoteBounceO1Y",0,defaultPlayerStrumY0+25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce1Y",4,defaultPlayerStrumY0+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 1 then
                noteTweenY("NoteBounceO2Y",1,defaultPlayerStrumY1+25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce2Y",5,defaultPlayerStrumY1+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 2 then
                noteTweenY("NoteBounceO3Y",2,defaultPlayerStrumY2+25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce3Y",6,defaultPlayerStrumY2+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 3 then
                noteTweenY("NoteBounceO4Y",3,defaultPlayerStrumY3+25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce4Y",7,defaultPlayerStrumY3+25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
        else
            if noteData == 0 then
                noteTweenY("NoteBounceO1Y",0,defaultPlayerStrumY0-25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce1Y",4,defaultPlayerStrumY0-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 1 then
                noteTweenY("NoteBounceO2Y",1,defaultPlayerStrumY1-25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce2Y",5,defaultPlayerStrumY1-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 2 then
                noteTweenY("NoteBounceO3Y",2,defaultPlayerStrumY2-25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce3Y",6,defaultPlayerStrumY2-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
            if noteData == 3 then
                noteTweenY("NoteBounceO4Y",3,defaultPlayerStrumY3-25, 0.015/getProperty('playbackRate'), 'sineInOut')
                noteTweenY("NoteBounce4Y",7,defaultPlayerStrumY3-25, 0.015/getProperty('playbackRate'), 'sineInOut')
            end
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'NoteBounce1Y' then
        noteTweenY("NoteBounceO1YF",0,defaultPlayerStrumY0, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteBounce1YF",4,defaultPlayerStrumY0, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce2Y' then
        noteTweenY("NoteBounceO2YF",1,defaultPlayerStrumY1, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteBounce2YF",5,defaultPlayerStrumY1, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce3Y' then
        noteTweenY("NoteBounceO3YF",2,defaultPlayerStrumY2, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteBounce3YF",6,defaultPlayerStrumY2, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if tag == 'NoteBounce4Y' then
        noteTweenY("NoteBounceO4YF",3,defaultPlayerStrumY3, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenY("NoteBounce4YF",7,defaultPlayerStrumY3, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
end

local hudAngleEffect = false
local hudFastEffect = false
local hudSlowEffect = false
local celebrateEffect = false
function onStepHit()
    if hudAngleEffect == true then
        if curStep % 4 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', 2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', 2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 8 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', -2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', -2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if hudFastEffect == true then
        if curStep % 2 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', 2.5, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', 2.5, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenX('camHUDX', 'camHUD', 12.25, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 4 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', -2.5, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', -2.5, 0.1/getProperty('playbackRate'), 'sineInOut')
            doTweenX('camHUDX', 'camHUD', -12.25, 0.1/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if hudSlowEffect == true then
        if curStep % 4 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', 2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', 2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenX('camHUDX', 'camHUD', 12.25, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 8 == 0 then
            doTweenAngle('camHUDAngle', 'camHUD', -2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenAngle('camGameAngle', 'camGame', -2.5, 0.25/getProperty('playbackRate'), 'sineInOut')
            doTweenX('camHUDX', 'camHUD', -12.25, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if celebrateEffect == true then
        if curStep % 4 == 0 then
            noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0+115, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1+112.5, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2+87.5, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3+85, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove1X",4,defaultPlayerStrumX0+100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove2X",5,defaultPlayerStrumX1+100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove3X",6,defaultPlayerStrumX2+100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove4X",7,defaultPlayerStrumX3+100, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('notethingX', 'notething', 100, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('num1X', 'numbers1', 25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('num2X', 'numbers2', 25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('Dnum1X', 'dark-numbers1', 25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('Dnum2X', 'dark-numbers2', 25, 0.35/getProperty('playbackRate'), 'sineInOut')
        end
        if curStep % 8 == 0 then
            noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0-115, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1-112.5, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2-87.5, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3-85, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove1X",4,defaultPlayerStrumX0-100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove2X",5,defaultPlayerStrumX1-100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove3X",6,defaultPlayerStrumX2-100, 0.35/getProperty('playbackRate'), 'sineInOut')
            noteTweenX("NoteMove4X",7,defaultPlayerStrumX3-100, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('notethingX', 'notething', -100, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('num1X', 'numbers1', -25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('num2X', 'numbers2', -25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('Dnum1X', 'dark-numbers1', -25, 0.35/getProperty('playbackRate'), 'sineInOut')
            doTweenX('Dnum2X', 'dark-numbers2', -25, 0.35/getProperty('playbackRate'), 'sineInOut')
        end
    end
end

function onBeatHit()
    if curBeat == 68 or curBeat == 84 or curBeat == 100 or curBeat == 116 or curBeat == 132 or curBeat == 148 or curBeat == 164 or curBeat == 180 then
        hudFastEffect = true
    end
    if curBeat == 70 or curBeat == 86 or curBeat == 102 or curBeat == 118 or curBeat == 134 or curBeat == 150 or curBeat == 166 or curBeat == 182 then
        hudFastEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 76 or curBeat == 108 or curBeat == 140 or curBeat == 172 then
        doTweenAngle('camHUDAngle', 'camHUD', 25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 92 or curBeat == 124 or curBeat == 156 or curBeat == 188 then
        doTweenAngle('camHUDAngle', 'camHUD', -25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', -25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 80 or curBeat == 96 or curBeat == 112 or curBeat == 128 or curBeat == 144 or curBeat == 160 or curBeat == 176 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.4/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 192 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 208 or curBeat == 240 or curBeat == 272 or curBeat == 304 then
        doTweenAngle('camHUDAngle', 'camHUD', 12.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 12.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        hudAngleEffect = false
    end
    if curBeat == 216 or curBeat == 248 or curBeat == 280 or curBeat == 312 then
        doTweenAngle('camHUDAngle', 'camHUD', -12.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', -12.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        hudAngleEffect = false
    end
    if curBeat == 212 or curBeat == 220 or curBeat == 244 or curBeat == 252 or curBeat == 275 or curBeat == 284 or curBeat == 307 or curBeat == 316 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
        hudAngleEffect = true
    end

    if curBeat == 335 then
        allowBounce = false
    end
    if curBeat >= 336 and curBeat < 430 then
		noteTweenAngle('playerNote4Angle', 4, -22.5, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote5Angle', 5, -11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote6Angle', 6, 11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote7Angle', 7, 22.5, 2/getProperty('playbackRate'), nothing)

		noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-20, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-10, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+10, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+20, 2/getProperty('playbackRate'), nothing)

		if downscroll then
			noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0-10, 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1-20, 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2-75, 2/getProperty('playbackRate'), qnothing)
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3-50, 2/getProperty('playbackRate'), nothing)
		else
			noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0+10, 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1+20, 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2+75, 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3+50, 2/getProperty('playbackRate'), nothing)
		end
    end

    if curBeat == 430 then
        noteTweenAngle('playerNote4Angle', 4, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAngle('playerNote5Angle', 5, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAngle('playerNote6Angle', 6, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenAngle('playerNote7Angle', 7, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.5/getProperty('playbackRate'), 'sineInOut')
		noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3, 0.5/getProperty('playbackRate'), 'sineInOut')
        allowBounce = true
    end

    if curBeat == 336 then
        hudAngleEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 431 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 436 or curBeat == 452 or curBeat == 468 or curBeat == 484 then
        hudFastEffect = true
    end
    if curBeat == 438 or curBeat == 454 or curBeat == 470 or curBeat == 486 then
        hudFastEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 444 or curBeat == 476 then
        doTweenAngle('camHUDAngle', 'camHUD', 25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 460 or curBeat == 492 then
        doTweenAngle('camHUDAngle', 'camHUD', -25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', -25, 2/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 2/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 448 or curBeat == 464 or curBeat == 480 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.4/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.4/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 496 then
        doTweenAngle('camHUDAngle', 'camHUD', 0, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 511 then
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 544 then
        hudSlowEffect = true
    end
    if curBeat == 574 then
        hudSlowEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 575 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0.35, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 576 or curBeat == 612 or curBeat == 644 then
        celebrateEffect = true
    end
    if curBeat == 608 or curBeat == 640 or curBeat == 672 then
        celebrateEffect = false
        noteTweenX("NoteMove1OX",0,defaultPlayerStrumX0+15, 0.35/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2OX",1,defaultPlayerStrumX1+12.5, 0.35/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3OX",2,defaultPlayerStrumX2-12.5, 0.35/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4OX",3,defaultPlayerStrumX3-15, 0.35/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove1X",4,defaultPlayerStrumX0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove2X",5,defaultPlayerStrumX1, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove3X",6,defaultPlayerStrumX2, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenX("NoteMove4X",7,defaultPlayerStrumX3, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('notethingX', 'notething', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('num1X', 'numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('num2X', 'numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('Dnum1X', 'dark-numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('Dnum2X', 'dark-numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 672 then
        hudSlowEffect = true
    end
    if curBeat == 704 then
        hudSlowEffect = false
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenX('camHUDX', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0, 0.15/getProperty('playbackRate'), 'sineInOut')
    end
end