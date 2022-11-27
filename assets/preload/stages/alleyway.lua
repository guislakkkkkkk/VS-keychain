function onCreatePost()

    makeLuaSprite('town', 'city', -360, -260)
    setLuaSpriteScrollFactor('town', 0.8, 0.8)
    scaleObject('town', 0.7, 0.7)

    makeLuaSprite('ovaries', 'overlay', -1460, -500)
    setLuaSpriteScrollFactor('ovaries', 1, 1)
    setBlendMode("ovaries", "add")

    makeLuaSprite('endoftheline', 'endoftheline', -2500, -730)
    setLuaSpriteScrollFactor('endoftheline', 1, 1)

    makeLuaSprite('sky', 'sky_colors', -2500, -820)
    setLuaSpriteScrollFactor('sky', 1, 1)

    makeLuaSprite('sun', 'the_sun', -620, -580)
    setLuaSpriteScrollFactor('sun', 0.8, 0.8)
    scaleObject('sun', 0.7, 0.7)


    addLuaSprite('ovaries', false)
    addLuaSprite('town', false)
    addLuaSprite('endoftheline', false)
    addLuaSprite('sky', false)
    addLuaSprite('sun', false)

    doTweenAlpha('ovaries', 'ovaries', 0.35, 0.0000000001, linear)

    setObjectOrder('endoftheline', getObjectOrder('sky') + 1)
    setObjectOrder('town', getObjectOrder('endoftheline') - 1)
    setObjectOrder('ovaries', getObjectOrder('dadGroup') + 1)

    doTweenAlpha('keyDuet', 'keyfriend', 0, 0.00000000000001, linear)

    -- BAR
    makeLuaSprite('DOM', 'empty', -110, -350)
	makeGraphic('DOM', 1500, 350, '000000')
	setObjectCamera('DOM', 'HUD')
	addLuaSprite('DOM', false)

    makeLuaSprite('SUB', 'empty', -110, 720)
	makeGraphic('SUB', 1500, 350, '000000')
	setObjectCamera('SUB', 'HUD')
	addLuaSprite('SUB', false)
end

function onSongStart()
    doTweenY('top :3', 'DOM', getProperty('DOM.y') + 100, 2, 'elasticOut')
    doTweenY('bottom ;)', 'SUB', getProperty('SUB.y') - 100, 2, 'elasticOut')

    setProperty('defaultCamZoom', 0.48)
end

-- events pushed
local push_bf = false
local push_duet = false

function onStepHit()
    if curStep >= 624 and not push_bf then
        makeAnimatedLuaSprite('styled', 'STYLED', 390, -70)
        addAnimationByPrefix('styled', 'play', 'STYLED', 24, false)
        addLuaSprite('styled', true)

        makeAnimatedLuaSprite('bfPush', 'characters/keyfriend', -280, 305)
        addAnimationByPrefix('bfPush', 'augh', 'KF AUGGH', 24, false)
        addAnimationByPrefix('bfPush', 'idle', 'KF idle', 24, true)
        objectPlayAnimation('bfPush', 'augh', true)
        addLuaSprite('bfPush', true)
        setObjectOrder('bfPush', getObjectOrder('ovaries') - 1)

        doTweenX('bfPushTween', 'bfPush', -430, 0.5, 'cubeOut');

        push_bf = true
    end

    if curStep >= 635 and not push_duet then
        removeLuaSprite('bfPush')
        doTweenAlpha('keyDuet', 'keyfriend', 1, 0.00000000000001, linear)
        setObjectOrder('keyfriend', getObjectOrder('ovaries') - 1)

        push_duet = true
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        setProperty('ovaries.alpha', 0.5)

        doTweenAlpha('ovaries', 'ovaries', 0.35, 0.5, 'cubeOut')
    end
end