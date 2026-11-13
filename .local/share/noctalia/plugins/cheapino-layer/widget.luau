local STATE_FILE = "/run/user/1000/cheapino-layer.state"

local function readLayer()
    local contents, err = noctalia.readFile(STATE_FILE)

    if not contents then
        return "OFF"
    end

    local state = contents:match("^%s*(.-)%s*$")

    if state == "BASE" or state == "LAYER 1" then
        return state
    end

    return "UNKNOWN"
end

function update()
    noctalia.setUpdateInterval(1000)

    barWidget.setGlyph("keyboard")
    barWidget.setText(readLayer())
    barWidget.setTooltip("Cheapino V2 active layer")
end
