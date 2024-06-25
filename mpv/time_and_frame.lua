local fps = mp.get_property_number("container-fps", 30) -- default to 30

mp.add_periodic_timer(1/fps, function()
    local time_pos = mp.get_property_number("time-pos", 0)
    local hours = math.floor(time_pos / 3600)
    local minutes = math.floor((time_pos % 3600) / 60)
    local seconds = math.floor(time_pos % 60)
    local milliseconds = math.floor((time_pos * 1000) % 1000)
    local time_str = string.format("%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    
    local frame = mp.get_property_number("estimated-frame-number", 0)
    mp.osd_message("Time: " .. time_str .. "\nFrame: " .. frame, 0.1)
end)
