# vi behaviour
#fish_vi_key_bindings
#set fish_cursor_default     block
#set fish_cursor_insert      line       blink
#set fish_cursor_replace_one underscore
#set fish_cursor_visual      block      blink

# disable greeting
set fish_greeting
set fish_prompt_pwd_dir_length 4

# setup plugin-foreign-env
set fish_function_path $fish_function_path ~/.config/fish/plugin-foreign-env/functions
fenv source ~/.profile
