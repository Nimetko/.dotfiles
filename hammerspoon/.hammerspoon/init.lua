--------------------------------------------------
-- Reload via URL: hammerspoon://reload
--------------------------------------------------
print(">>> registering reload handler")

hs.urlevent.bind("reload", function(eventName, params)
    print(">>> url event fired:", eventName)
    hs.alert.show("Reloading Hammerspoon…")
    hs.reload()
end)

hs.alert.show("Config loaded")

--------------------------------------------------------
-- Per-app top bar + left/right border + bottom offset
--------------------------------------------------------

local appBarConfigs = {
    ["ChatGPT"]       = { h = 37, bottom = 2, hideButtons = false },
    ["Google Chrome"] = { h = 4,  bottom = 4, hideButtons = true  },
    -- we don't need for iTerm2, settings no native full screen is supporting this
    -- ["iTerm2"]        = { h = 28, bottom = 5, hideButtons = false },
}

-- 6 drawing objects
local topBar, leftBar, rightBar, bottomBar, buttonsCover, buttonsCover2 =
    nil, nil, nil, nil, nil, nil

local function deleteBars()
    if topBar        then topBar:delete();        topBar = nil        end
    if leftBar       then leftBar:delete();       leftBar = nil       end
    if rightBar      then rightBar:delete();      rightBar = nil      end
    if bottomBar     then bottomBar:delete();     bottomBar = nil     end
    if buttonsCover  then buttonsCover:delete();  buttonsCover = nil  end
    if buttonsCover2 then buttonsCover2:delete(); buttonsCover2 = nil end
end

local function updateTopBarForApp(appName)
    deleteBars()

    local cfg = appBarConfigs[appName]
    if not cfg then return end

    local screen = hs.screen.mainScreen()
    local frame  = screen:frame()   -- usable area below menu bar

    local border = 2 -- left/right thickness

    --------------------------------------------------
    -- TOP BAR (per-app height)
    --------------------------------------------------
    local topFrame = {
        x = frame.x,
        y = frame.y,
        w = frame.w,
        h = cfg.h,
    }

    topBar = hs.drawing.rectangle(topFrame)
    topBar:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
    topBar:setStroke(false)
    topBar:setLevel(hs.drawing.windowLevels.floating)
    topBar:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    topBar:show()

    --------------------------------------------------
    -- LEFT BORDER (2px)
    --------------------------------------------------
    local leftFrame = {
        x = frame.x,
        y = frame.y,
        w = border,
        h = frame.h,
    }

    leftBar = hs.drawing.rectangle(leftFrame)
    leftBar:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
    leftBar:setStroke(false)
    leftBar:setLevel(hs.drawing.windowLevels.floating)
    leftBar:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    leftBar:show()

    --------------------------------------------------
    -- RIGHT BORDER (2px)
    --------------------------------------------------
    local rightFrame = {
        x = frame.x + frame.w - border,
        y = frame.y,
        w = border,
        h = frame.h,
    }

    rightBar = hs.drawing.rectangle(rightFrame)
    rightBar:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
    rightBar:setStroke(false)
    rightBar:setLevel(hs.drawing.windowLevels.floating)
    rightBar:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    rightBar:show()

    --------------------------------------------------
    -- BOTTOM BORDER (per-app offset height)
    --------------------------------------------------
    local bottomHeight = cfg.bottom or 2

    local bottomFrame = {
        x = frame.x,
        y = frame.y + frame.h - bottomHeight,
        w = frame.w,
        h = bottomHeight,
    }

    bottomBar = hs.drawing.rectangle(bottomFrame)
    bottomBar:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
    bottomBar:setStroke(false)
    bottomBar:setLevel(hs.drawing.windowLevels.floating)
    bottomBar:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
    bottomBar:show()

    --------------------------------------------------
    -- COVERS (traffic lights) – LEFT & RIGHT
    --------------------------------------------------
    if cfg.hideButtons then
        --------------------------------------------------
        -- LEFT COVER (pôvodný, cez 3 tlačidlá)
        --------------------------------------------------
        local coverWidth  = 90
        local coverHeight = 36

        local buttonsFrame = {
            x = frame.x,    -- left edge
            y = frame.y,    -- top edge of app content
            w = coverWidth,
            h = coverHeight,
        }

        buttonsCover = hs.drawing.rectangle(buttonsFrame)
        buttonsCover:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
        buttonsCover:setStroke(false)
        buttonsCover:setLevel(hs.drawing.windowLevels.floating)
        buttonsCover:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
        buttonsCover:show()

        --------------------------------------------------
        -- RIGHT COVER (nový buttonsCover2)
        --------------------------------------------------
        local coverWidth2  = 120   -- iné rozmery ako vľavo
        local coverHeight2 = 36    -- pokojne zmeň podľa oka

        local buttonsFrame2 = {
            x = frame.x + frame.w - coverWidth2, -- nalepené na pravý okraj
            y = frame.y,
            w = coverWidth2,
            h = coverHeight2,
        }

        buttonsCover2 = hs.drawing.rectangle(buttonsFrame2)
        buttonsCover2:setFillColor({ red = 0, green = 0, blue = 0, alpha = 1 })
        buttonsCover2:setStroke(false)
        buttonsCover2:setLevel(hs.drawing.windowLevels.floating)
        buttonsCover2:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
        buttonsCover2:show()
    end
end

--------------------------------------------------
-- App watcher
--------------------------------------------------
local appWatcher = hs.application.watcher.new(function(appName, eventType, app)
    if eventType == hs.application.watcher.activated then
        updateTopBarForApp(appName)
    end
end)

appWatcher:start()

-- Initial render
local front = hs.application.frontmostApplication()
if front then updateTopBarForApp(front:name()) end
