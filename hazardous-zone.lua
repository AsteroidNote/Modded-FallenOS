function onCreate()
	makeLuaSprite('bg','hazard-week/bg', 0, 0)
	setScrollFactor('bg', 0, 0);
	screenCenter('bg')
	addLuaSprite('bg')
	setProperty('bg.alpha', 0)

	makeLuaSprite('circle','hazard-week/circle', 0, 0)
	setScrollFactor('circle', 0, 0);
	screenCenter('circle')
	addLuaSprite('circle')
	setProperty('circle.alpha', 0)

	if not lowQuality then
		makeLuaSprite('dark-numbers1','hazard-week/dark-nums', 0, 0)
		setScrollFactor('dark-numbers1', 0, 0);
		screenCenter('dark-numbers1')
		addLuaSprite('dark-numbers1')
		makeLuaSprite('dark-numbers2','hazard-week/dark-nums', 0, 0)
		setScrollFactor('dark-numbers2', 0, 0);
		screenCenter('dark-numbers2')
		setProperty('dark-numbers2.y', getProperty('dark-numbers2.y')-730)
		addLuaSprite('dark-numbers2')
		setProperty('dark-numbers1.alpha', 0)
		setProperty('dark-numbers2.alpha', 0)
		makeLuaSprite('numbers1','hazard-week/nums', 0, 0)
		setScrollFactor('numbers1', 0, 0);
		screenCenter('numbers1')
		addLuaSprite('numbers1')
		makeLuaSprite('numbers2','hazard-week/nums', 0, 0)
		setScrollFactor('numbers2', 0, 0);
		screenCenter('numbers2')
		setProperty('numbers2.y', getProperty('numbers2.y')-730)
		addLuaSprite('numbers2')
		setProperty('numbers1.alpha', 0)
		setProperty('numbers2.alpha', 0)
	end

	makeLuaSprite('dark-lines','hazard-week/dark-lines', 0, 0)
	setScrollFactor('dark-lines', 0, 0);
	screenCenter('dark-lines')
	addLuaSprite('dark-lines')
	setProperty('dark-lines.alpha', 0)
	makeLuaSprite('lines','hazard-week/lines', 0, 0)
	setScrollFactor('lines', 0, 0);
	screenCenter('lines')
	addLuaSprite('lines')
	setProperty('lines.alpha', 0)

	makeAnimatedLuaSprite('dark-hazard', 'hazard-week/dark-hazard', 0, 0);
	if songName == 'Pr0cess1ng An0maly' then
		addAnimationByPrefix('dark-hazard', 'laugh', 'hazard', 16, true)
	end
	if songName == 'Uncontrolled Reaction' then
		addAnimationByPrefix('dark-hazard', 'laugh', 'hazard', 8, true)
	end
	addLuaSprite('dark-hazard', false);
	setGraphicSize('dark-hazard', 1286, 730);
	setScrollFactor('dark-hazard', 0, 0);
	screenCenter('dark-hazard');
	setProperty('dark-hazard.alpha', 0)

	makeAnimatedLuaSprite('hazard', 'hazard-week/hazard', 0, 0);
	if songName == 'Pr0cess1ng An0maly' then
		addAnimationByPrefix('hazard', 'laugh', 'hazard', 16, true)
	end
	if songName == 'Uncontrolled Reaction' then
		addAnimationByPrefix('hazard', 'laugh', 'hazard', 8, true)
	end
	addLuaSprite('hazard', false);
	setGraphicSize('hazard', 1286, 730);
	setScrollFactor('hazard', 0, 0);
	screenCenter('hazard');
	setProperty('hazard.alpha', 0)
 
	makeLuaSprite('notething','hazard-week/notething',0,0)
	addLuaSprite('notething', false)
	setScrollFactor('notething', 0, 0);
	screenCenter('notething')
	setProperty('notething.alpha', 0.75)

	makeLuaSprite('vignette', 'inhumanPack/background/vignette', 0, 0);
	addLuaSprite('vignette', false);
	setScrollFactor('vignette', 0, 0);
	screenCenter('vignette');

	makeLuaSprite('vrc','hazard-week/vcrlines',0,0)
	setScrollFactor('vrc', 0, 0);
	screenCenter('vrc')
	setObjectCamera('vrc', 'camOther')
	setProperty('vrc.alpha', 0.5)
	scaleObject('vrc', 1.5, 1.5)
	addLuaSprite('vrc')

	if flashingLights then
        makeLuaSprite('alert-v1', 'hazard-week/alert-vignette', 0, 0);
        addLuaSprite('alert-v1', false);
        setScrollFactor('alert-v1', 0, 0);
        screenCenter('alert-v1');
        makeLuaSprite('alert-v2', 'hazard-week/alert-vignette', 0, 0);
        addLuaSprite('alert-v2', false);
        setScrollFactor('alert-v2', 0, 0);
        screenCenter('alert-v2');
        setProperty('alert-v2.angle', 180)
		setProperty('alert-v1.alpha', 0)
		setProperty('alert-v2.alpha', 0)
    end
end

local numEffect = true
local colorNum = 0
function onUpdate(elapsed)
	if numEffect then
		if not lowQuality then
			setProperty('numbers1.y', getProperty('numbers1.y')+0.77)
			setProperty('numbers2.y', getProperty('numbers2.y')+0.77)
			if getProperty('numbers1.y') > screenHeight then
				setProperty('numbers1.y', getProperty('numbers1.y')-1460)
			elseif getProperty('numbers2.y') > screenHeight then
				setProperty('numbers2.y', getProperty('numbers1.y')-730)
			end
			setProperty('dark-numbers1.y', getProperty('numbers1.y'))
			setProperty('dark-numbers2.y', getProperty('numbers2.y'))
		end
	end

	setProperty('circle.angle', getProperty('circle.angle')+colorNum)
end

function onSongStart()
	doTweenAlpha('BGAlpha', 'bg', 1, 5/getProperty('playbackRate'), 'sineInOut')
	doTweenColor('BGColor', 'bg', '707070', 5/getProperty('playbackRate'), 'sineInOut')
	doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 5/getProperty('playbackRate'), 'sineInOut')
	doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 5/getProperty('playbackRate'), 'sineInOut')
	doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 5/getProperty('playbackRate'), 'sineInOut')
end

function onStepHit()
	if flashingLights then
		if songName == 'Pr0cess1ng An0maly' then
			if curStep == 1308 or curStep == 1340 or curStep == 1372 or curStep == 1404 or curStep == 1436 or curStep == 1468 or curStep == 1500 or curStep == 1564 or curStep == 1596 or curStep == 1628 or curStep == 1660 or curStep == 1692 or curStep == 1724 or curStep == 1756 then
				doTweenColor('BGColor', 'bg', 'B200FF', 0.00015/getProperty('playbackRate'), 'sineInOut')
			end
			if curStep == 1309 or curStep == 1341 or curStep == 1373 or curStep == 1405 or curStep == 1437 or curStep == 1469 or curStep == 1501 or curStep == 1565 or curStep == 1597 or curStep == 1629 or curStep == 1661 or curStep == 1693 or curStep == 1725 or curStep == 1757 then
				doTweenColor('BGColor', 'bg', '4CFF00', 0.00015/getProperty('playbackRate'), 'sineInOut')
			end
			if curStep == 1310 or curStep == 1342 or curStep == 1374 or curStep == 1406 or curStep == 1438 or curStep == 1470 or curStep == 1502 or curStep == 1566 or curStep == 1598 or curStep == 1630 or curStep == 1662 or curStep == 1694 or curStep == 1726 or curStep == 1758 then
				doTweenColor('BGColor', 'bg', '6B8CFD', 0.00015/getProperty('playbackRate'), 'sineInOut')
			end
		end
	end
end

local gradientEffect = false
local alert1 = false
local alert2 = false
local alphaNum = 0
function onBeatHit()
	if gradientEffect == true then
		if curBeat % 1 == 0 then
			if alert1 == true then
				setProperty('alert-v1.alpha', alphaNum)
				doTweenAlpha('alert-v1Alpha', 'alert-v1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			end
			alert1 = false
			alert2 = true
		end
		if curBeat % 2 == 0 then
			if alert2 == true then
				setProperty('alert-v2.alpha', alphaNum)
				doTweenAlpha('alert-v2Alpha', 'alert-v2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			end
			alert2 = false
			alert1 = true
		end
	end

	if songName == 'Pr0cess1ng An0maly' then
		if curBeat == 124 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 128 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 190 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 192 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 254 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 256 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 303 then
			gradientEffect = true
        end
		if curBeat == 304 then
			alphaNum = 0.25
		end
		if curBeat == 308 then
			alphaNum = 0.5
		end
		if curBeat == 312 then
			alphaNum = 0.75
		end
		if curBeat == 316 then
			alphaNum = 1
		end
        if curBeat == 317 then
			gradientEffect = false
        end
		if curBeat == 318 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 319 then
			gradientEffect = true
        end
		if curBeat == 320 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 381 then
			gradientEffect = false
		end
		if curBeat == 382 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 383 then
			gradientEffect = true
		end
		if curBeat == 384 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 446 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 447 then
			gradientEffect = false
		end
		if curBeat == 448 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '707070', 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			alphaNum = 0
		end
		if curBeat == 480 then
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 540 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.75/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 544 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 606 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 608 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 655 then
			gradientEffect = true
		end
		if curBeat == 656 then
			alphaNum = 0.25
		end
		if curBeat == 660 then
			alphaNum = 0.5
		end
		if curBeat == 664 then
			alphaNum = 0.75
		end
		if curBeat == 667 then
			gradientEffect = false
		end
		if curBeat == 670 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 672 then
			alphaNum = 0
			doTweenAlpha('BGAlpha', 'bg', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0.65, 0.75/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 735 then
			doTweenAlpha('camHUDAlpha', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('BGAlpha', 'bg', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		end
	end

	if songName == 'Uncontrolled Reaction' then
		if curBeat == 60 then
			doTweenAlpha('BGAlpha', 'bg', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 2/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 63 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			cancelTween('BGColor')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 64 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 76 or curBeat == 92 or curBeat == 108 or curBeat == 124 or curBeat == 140 or curBeat == 156 or curBeat == 172 or curBeat == 188 then
			doTweenColor('BGColor', 'bg', '707070', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 126 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 128 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 80 or curBeat == 96 or curBeat == 112 or curBeat == 128 or curBeat == 144 or curBeat == 160 or curBeat == 176 then
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 204 then
			doTweenAlpha('BGAlpha', 'bg', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 2/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 208 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 214 or curBeat == 222 or curBeat == 246 or curBeat == 254 or curBeat == 278 or curBeat == 286 or curBeat == 310 or curBeat == 318 then
			doTweenColor('BGColor', 'bg', '707070', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 216 or curBeat == 224 or curBeat == 248 or curBeat == 256 or curBeat == 280 or curBeat == 288 or curBeat == 312 or curBeat == 320 then
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 334 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 336 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.3/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 337 then
			doTweenColor('BGColor', 'bg', '707070', 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 4/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 366 or curBeat == 398 or curBeat == 428 then
			setProperty('bg.alpha', 0.6)
			numEffect = false
		end
		if curBeat == 368 or curBeat == 400 then
			setProperty('bg.alpha', 1)
			numEffect = true
		end
		if curBeat == 429 then
			doTweenAlpha('BGAlpha', 'bg', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 1/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 1/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 431 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			cancelTween('BGColor')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.15/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 432 then
			numEffect = true
			doTweenAlpha('BGAlpha', 'bg', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.15/getProperty('playbackRate'), 'sineInOut')
		end

		if curBeat == 444 or curBeat == 460 or curBeat == 476 or curBeat == 492 then
			doTweenColor('BGColor', 'bg', '707070', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 448 or curBeat == 464 or curBeat == 480 then
			doTweenColor('BGColor', 'bg', '6B8CFD', 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 508 then
			doTweenAlpha('BGAlpha', 'bg', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 2/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 0, 2/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 512 then
			doTweenAlpha('BGAlpha', 'bg', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 1, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 4/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 542 then
			doTweenColor('BGColor', 'bg', '707070', 0.025/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('BGAlpha', 'bg', 0.4, 0.025/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.025/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.025/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.025/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.025/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 544 then
			-- ADD HERE NEW STUFF
			doTweenAlpha('BGAlpha', 'bg', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenColor('BGColor', 'bg', '6B8CFD', 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('CircleAlpha', 'circle', 0.5, 16/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 4/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 4/getProperty('playbackRate'), 'sineInOut')
			colorNum = 0.75
		end
		if curBeat == 574 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('CircleAlpha', 'circle', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 576 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('CircleAlpha', 'circle', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			colorNum = -1.5
		end
		if curBeat == 608 then
			setProperty('circle.alpha', 0.5)
			colorNum = 0.5
		end
		if curBeat == 612 then
			setProperty('circle.alpha', 1)
			colorNum = -1.5
		end
		if curBeat == 640 then
			setProperty('circle.alpha', 0.75)
			colorNum = 0
		end
		if curBeat == 644 then
			setProperty('circle.alpha', 1)
			colorNum = -1.5
		end

		if curBeat == 657 or curBeat == 659 or curBeat == 661 or curBeat == 663 then
			setProperty('circle.alpha', 0.2)
			setProperty('numbers1.alpha', 0)
			setProperty('numbers2.alpha', 0)
			setProperty('lines.alpha', 0)
			setProperty('hazard.alpha', 0)
			colorNum = 1.5
		end
		if curBeat == 658 or curBeat == 660 or curBeat == 662 or curBeat == 664 then
			setProperty('circle.alpha', 1)
			setProperty('numbers1.alpha', 1)
			setProperty('numbers2.alpha', 1)
			setProperty('lines.alpha', 1)
			setProperty('hazard.alpha', 1)
			colorNum = -1.5
		end
		if curBeat == 672 then
			colorNum = -1
			doTweenAlpha('BGAlpha', 'bg', 1, 0.25/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('CircleAlpha', 'circle', 0, 16/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 736 then
			doTweenAlpha('BGAlpha', 'bg', 0.75, 0.25/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 768 then
			doTweenColor('BGColor', 'bg', '707070', 16/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('LinesAlpha', 'lines', 0, 16/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num1Alpha', 'numbers1', 0, 16/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('Num2Alpha', 'numbers2', 0, 16/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('hazardLAUGH', 'hazard', 0, 16/getProperty('playbackRate'), 'sineInOut')
		end
		if curBeat == 832 then
			setProperty('bg.alpha', 0.7)
		end
		if curBeat == 840 then
			setProperty('bg.alpha', 0.5)
		end
		if curBeat == 848 then
			setProperty('bg.alpha', 0.3)
		end
		if curBeat == 856 then
			setProperty('bg.alpha', 0.25)
		end
		if curBeat == 864 then
			doTweenAlpha('BGAlpha', 'bg', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkLinesAlpha', 'dark-lines', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum1Alpha', 'dark-numbers1', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('DarkNum2Alpha', 'dark-numbers2', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('dark-hazardLAUGH', 'dark-hazard', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
			doTweenAlpha('camHUDAlpha', 'camHUD', 0, 0.5/getProperty('playbackRate'), 'sineInOut')
		end
	end
end