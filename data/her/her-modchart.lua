function onCreate()
    if flashingLights then
        makeLuaSprite('up-down-thing', 'inhumanPack/hud/up-down-thing', 0, 0);
        addLuaSprite('up-down-thing', false);
        setScrollFactor('up-down-thing', 0, 0);
        screenCenter('up-down-thing');
        setObjectCamera('up-down-thing', 'Other')
        setProperty('up-down-thing.alpha', 0)
    end

    if downscroll then
        setProperty('up-down-thing.angle', 180)
    else
        setProperty('up-down-thing.angle', 0)
    end
end

local noteMovementEffect = false
local moveNum = 1
function onUpdate(elapsed)
    for i = 0,7 do
        if getPropertyFromGroup("strumLineNotes",i,"x") > 1300 then
            setPropertyFromGroup("strumLineNotes",i,"x",(getPropertyFromGroup("strumLineNotes",i,"x") - 1420))
        end
    end

    if noteMovementEffect == true then
        for i = 0,7 do
            setPropertyFromGroup("strumLineNotes",i,"x",getPropertyFromGroup("strumLineNotes",i,"x") + ((60/bpm)*moveNum)*getProperty('playbackRate'))
        end
    end
end

local changeScroll = false
function onBeatHit()
    if changeScroll == true then
        if curBeat % 1 == 0 then
            if downscroll then
                for i = 0,7 do
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
            setProperty('up-down-thing.angle', getProperty('up-down-thing.angle')+180)
            setProperty('up-down-thing.alpha', 1)
            doTweenAlpha('up-down', 'up-down-thing', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
        if curBeat % 2 == 0 then
            if downscroll then
                for i = 0,7 do
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
            setProperty('up-down-thing.angle', getProperty('up-down-thing.angle')+360)
            setProperty('up-down-thing.alpha', 1)
            doTweenAlpha('up-down', 'up-down-thing', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        end
    end

    if curBeat == 31 then
        changeScroll = true
    end

    if curBeat == 28 then
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 1.5/getProperty('playbackRate'), 'sineInOut')
    end
    if curBeat == 32 then
        setProperty('defaultCamHUDZoom', 0.9)
    end

    if curBeat == 59 then
        changeScroll = false
    end
    if curBeat == 60 then
        doTweenZoom('camHUDZoom', 'camHUD', 1.1, 1.25/getProperty('playbackRate'), 'sineOut')
        doTweenZoom('camGameZoom', 'camGame', 1.25, 1.25/getProperty('playbackRate'), 'sineOut')
        doTweenAngle('camHUDAngle', 'camHUD', -12.25, 1.25/getProperty('playbackRate'), 'sineOut')
		doTweenAngle('camGameAngle', 'camGame', -12.25, 1.25/getProperty('playbackRate'), 'sineOut')
        setProperty('defaultCamHUDZoom', 1.1)
        setProperty('defaultCamZoom', 1.25)
    end

    if curBeat == 62 then 
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
        noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-685, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-685, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultPlayerStrumX2-685, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultPlayerStrumX3-685, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 1, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 63 then
        changeScroll = true
    end

    if curBeat == 64 then
        noteMovementEffect = true
        moveNum = 1.5
        doTweenAngle('camHUDAngle', 'camHUD', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		doTweenAngle('camGameAngle', 'camGame', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.9, 0.25/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camGameZoom', 'camGame', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
        setProperty('defaultCamHUDZoom', 0.9)
        setProperty('defaultCamZoom', 1)
    end

    if curBeat == 128 then
        moveNum = 3
    end
    if curBeat == 128 or curBeat == 136 or curBeat == 144 or curBeat == 152 then
        noteTweenAngle('doAngleLol0', 0, 5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol1', 1, -5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol2', 2, 5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol3', 3, -5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol4', 4, 5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol5', 5, -5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol6', 6, 5, 0.2/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol7', 7, -5, 0.2/getProperty('playbackRate'), 'sineInOut')
    end

    if curBeat == 155 then
        changeScroll = false
    end

    if curBeat == 156 then
        noteMovementEffect = false
        moveNum = 1
        noteTweenX('playerNote0X', 0, defaultOpponentStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 1, defaultOpponentStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 2, defaultOpponentStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 3, defaultOpponentStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote0X', 4, defaultPlayerStrumX0, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote1X', 5, defaultPlayerStrumX1, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote2X', 6, defaultPlayerStrumX2, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenX('playerNote3X', 7, defaultPlayerStrumX3, 1/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        doTweenZoom('camHUDZoom', 'camHUD', 0.95, 1/getProperty('playbackRate'), 'sineInOut')
        setProperty('defaultCamHUDZoom', 0.95)
    end

    if curBeat == 190 then
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0);
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1);
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2);
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3);
    end
    if curBeat == 192 then
        noteTweenAlpha('playerNote0Alpha', 0, 0.35/getProperty('playbackRate'), 0.5, 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0.35/getProperty('playbackRate'), 0.5, 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0.35/getProperty('playbackRate'), 0.5, 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0.35/getProperty('playbackRate'), 0.5, 'sineInOut')
    end
    
    if curBeat == 220 then
        noteTweenAlpha('playerNote0Alpha', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote1Alpha', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote2Alpha', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAlpha('playerNote3Alpha', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end

	if curBeat >= 224 and curBeat < 288 then
		doTweenAngle('camHUDlol', 'camHUD', 25, 10/getProperty('playbackRate'), nothing)
        doTweenZoom('camHUDZoom', 'camHUD', 0.25, 15/getProperty('playbackRate'), nothing)
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 10/getProperty('playbackRate'), nothing)

		-- player part
		noteTweenAngle('playerNote4Angle', 4, -22.5, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote5Angle', 5, -11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote6Angle', 6, 11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote7Angle', 7, 22.5, 2/getProperty('playbackRate'), nothing)

		noteTweenX('playerNote4X', 4, defaultPlayerStrumX0-50, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-25, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+25, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote7X', 7, defaultPlayerStrumX3+50, 2/getProperty('playbackRate'), nothing)

		if downscroll then
            noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0-(25/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1-(75/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2-(175/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3-(125/2), 2/getProperty('playbackRate'), nothing)
		else
			noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0+(25/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1+(75/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2+(175/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3+(125/2), 2/getProperty('playbackRate'), nothing)
		end

		-- opponent part too
		noteTweenAngle('playerNote0Angle', 0, -22.5, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote1Angle', 1, -11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote2Angle', 2, 11.25, 2/getProperty('playbackRate'), nothing)
		noteTweenAngle('playerNote3Angle', 3, 22.5, 2/getProperty('playbackRate'), nothing)

		noteTweenX('playerNote0X', 0, defaultPlayerStrumX0-50, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote1X', 1, defaultPlayerStrumX1-25, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote2X', 2, defaultPlayerStrumX2+25, 2/getProperty('playbackRate'), nothing)
		noteTweenX('playerNote3X', 3, defaultPlayerStrumX3+50, 2/getProperty('playbackRate'), nothing)

		if downscroll then
			noteTweenY('playerNote0Y', 0, defaultPlayerStrumY0-(25/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote1Y', 1, defaultPlayerStrumY1-(75/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote2Y', 2, defaultPlayerStrumY2-(175/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote3Y', 3, defaultPlayerStrumY3-(125/2), 2/getProperty('playbackRate'), nothing)
		else
            noteTweenY('playerNote0Y', 0, defaultPlayerStrumY0+(25/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote1Y', 1, defaultPlayerStrumY1+(75/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote2Y', 2, defaultPlayerStrumY2+(175/2), 2/getProperty('playbackRate'), nothing)
			noteTweenY('playerNote3Y', 3, defaultPlayerStrumY3+(125/2), 2/getProperty('playbackRate'), nothing)
		end
	end

    if curBeat == 288 then
        doTweenAngle('camHUDlol', 'camHUD', 20, 1/getProperty('playbackRate'), 'sineInOut')
        doTweenAlpha('camHUDAlpha', 'camHUD', 0, 1/getProperty('playbackRate'), 'sineInOut')
    end
end

function onStepHit()
    if curStep == 640 or curStep == 656 or curStep == 672 or curStep == 680 or curStep == 688 or curStep == 696 or curStep == 704 or curStep == 720 or curStep == 736 or curStep == 744 or curStep == 768 or curStep == 784 or curStep == 800 or curStep == 808 or curStep == 816 or curStep == 824 or curStep == 832 or curStep == 848 or curStep == 864 or curStep == 872 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3+64, 0.15/getProperty('playbackRate'), 'sineIn')
    end
    if curStep == 642 or curStep == 658 or curStep == 674 or curStep == 682 or curStep == 690 or curStep == 698 or curStep == 706 or curStep == 722 or curStep == 738 or curStep == 746 or curStep == 770 or curStep == 786 or curStep == 802 or curStep == 810 or curStep == 818 or curStep == 826 or curStep == 834 or curStep == 850 or curStep == 866 or curStep == 874 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX1, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX0, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX3, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX2, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3, 0.15/getProperty('playbackRate'), 'sineOut')
    end
    if curStep == 644 or curStep == 660 or curStep == 676 or curStep == 684 or curStep == 692 or curStep == 700 or curStep == 708 or curStep == 724 or curStep == 740 or curStep == 748 or curStep == 772 or curStep == 788 or curStep == 804 or curStep == 812 or curStep == 820 or curStep == 828 or curStep == 836 or curStep == 852 or curStep == 868 or curStep == 876 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0-64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2+64, 0.15/getProperty('playbackRate'), 'sineIn')
        noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3-64, 0.15/getProperty('playbackRate'), 'sineIn')
    end
    if curStep == 646 or curStep == 662 or curStep == 678 or curStep == 686 or curStep == 694 or curStep == 702 or curStep == 710 or curStep == 726 or curStep == 742 or curStep == 750 or curStep == 774 or curStep == 790 or curStep == 806 or curStep == 814 or curStep == 822 or curStep == 830 or curStep == 838 or curStep == 854 or curStep == 870 or curStep == 878 then
        noteTweenX('playerNote4X', 4, defaultPlayerStrumX0, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote5X', 5, defaultPlayerStrumX1, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote6X', 6, defaultPlayerStrumX2, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenX('playerNote7X', 7, defaultPlayerStrumX3, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote4Y', 4, defaultPlayerStrumY0, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote5Y', 5, defaultPlayerStrumY1, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote6Y', 6, defaultPlayerStrumY2, 0.15/getProperty('playbackRate'), 'sineOut')
        noteTweenY('playerNote7Y', 7, defaultPlayerStrumY3, 0.15/getProperty('playbackRate'), 'sineOut')
    end
end

function onTweenCompleted(tag)
    if tag == 'doAngleLol0' then
        noteTweenAngle('doAngleLol0Cancel', 0, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol1Cancel', 1, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol2Cancel', 2, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol3Cancel', 3, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol4Cancel', 4, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol5Cancel', 5, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol6Cancel', 6, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
        noteTweenAngle('doAngleLol7Cancel', 7, 0, 0.5/getProperty('playbackRate'), 'sineInOut')
    end
end