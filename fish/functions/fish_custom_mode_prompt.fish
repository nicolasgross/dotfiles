function fish_custom_mode_prompt --description "Display the default mode for the prompt"
    # Do nothing if not in vi mode
    if test "$fish_key_bindings" = "fish_vi_key_bindings"
        or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
        switch $fish_bind_mode
            case default
                set_color green
                echo -n '🅽 '
            case insert
                set_color cyan
                echo -n '🅸 '
            case replace_one
                set_color magenta
                echo -n '🆁 '
            case visual
                set_color yellow
                echo -n '🆅 '
        end
        set_color normal
        echo -n ' '
    end
end

