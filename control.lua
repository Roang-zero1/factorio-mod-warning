function add_handler()
    if settings.global["mod-warning-disable-mod-warning"].value then
        script.on_nth_tick(60, nil)
    else
        script.on_nth_tick(60, function(event)
            for k, player in pairs(game.players) do
                if player.gui.top["showmenu"] == nil then
                    rendering.draw_text {
                        text = "MODS ARE ENABLED",
                        target = player.position,
                        surface = player.surface,
                        color = { r = 1, g = 0, b = 0 },
                        scale = 20,
                        time_to_live = 60,
                        alignment = 'center',
                        vertical_alignment = 'middle',
                        scale_with_zoom = true, }
                end
            end
        end)
    end
end

add_handler()
script.on_event(defines.events.on_runtime_mod_setting_changed, function(event)
    add_handler()
end)
