# Based on:
# - C. Morrell's Fish Theme (https://github.com/oh-my-fish/theme-cmorrell.com)
# - fish's informative_vcs sample prompt
# Heavily inspired by:
# - mathiasbynens' bash prompt (https://github.com/mathiasbynens/dotfiles)

## Function to show a segment
function prompt_segment -d "Function to show a segment"
	# Get colors
	set -l bg $argv[1]
	set -l fg $argv[2]

	# Set 'em
	set_color -b $bg
	set_color -o $fg

	# Print text
	if [ -n "$argv[3]" ]
		echo -e -n -s $argv[3]
	end
end

## Function to show current status
function show_ssh -d "Function to show the current status"
	if [ -n "$SSH_CLIENT" ]
		prompt_segment blue white " SSH: "
	end
end

## Show active python virtual environment
function show_virtualenv -d "Show active python virtual environments"
	if set -q VIRTUAL_ENV
		set -l venvname (basename "$VIRTUAL_ENV")
		prompt_segment normal white " ($venvname) "
	end
end

## Show user if not in default users
function show_user -d "Show user"
	set -l who (whoami)
	prompt_segment normal red "$who"
	set -l host (hostname -s)
	prompt_segment normal white " at"
	prompt_segment normal yellow " $host"
	prompt_segment normal white " in "
end

## ???
function _set_venv_project --on-variable VIRTUAL_ENV
	if test -e $VIRTUAL_ENV/.project
		set -g VIRTUAL_ENV_PROJECT (cat $VIRTUAL_ENV/.project)
	end
end

# Show directory
function show_pwd -d "Show the current directory"
	set -l pwd
	if [ (string match -r '^'"$VIRTUAL_ENV_PROJECT" $PWD) ]
		set pwd (string replace -r '^'"$VIRTUAL_ENV_PROJECT"'($|/)' '≫ $1' $PWD)
	else
		set pwd (dirs)
	end
	prompt_segment normal green "$pwd"
end

## Show git status
function show_git_status -d "Gets the current git status"
	### Shamelessly copied from informative_vcs prompt
	if not set -q __fish_git_prompt_show_informative_status
		set -g __fish_git_prompt_show_informative_status 1
	end
	if not set -q __fish_git_prompt_hide_untrackedfiles
		set -g __fish_git_prompt_hide_untrackedfiles 1
	end

	if not set -q __fish_git_prompt_color_branch
		set -g __fish_git_prompt_color_branch magenta --bold
	end
	if not set -q __fish_git_prompt_showupstream
		set -g __fish_git_prompt_showupstream "informative"
	end
	if not set -q __fish_git_prompt_char_upstream_ahead
		set -g __fish_git_prompt_char_upstream_ahead "↑"
	end
	if not set -q __fish_git_prompt_char_upstream_behind
		set -g __fish_git_prompt_char_upstream_behind "↓"
	end
	if not set -q __fish_git_prompt_char_upstream_prefix
		set -g __fish_git_prompt_char_upstream_prefix ""
	end

	if not set -q __fish_git_prompt_char_stagedstate
		set -g __fish_git_prompt_char_stagedstate "●"
	end
	if not set -q __fish_git_prompt_char_dirtystate
		set -g __fish_git_prompt_char_dirtystate "+"
	end
	if not set -q __fish_git_prompt_char_untrackedfiles
		set -g __fish_git_prompt_char_untrackedfiles "…"
	end
	if not set -q __fish_git_prompt_char_conflictedstate
		set -g __fish_git_prompt_char_conflictedstate "✖"
	end
	if not set -q __fish_git_prompt_char_cleanstate
		set -g __fish_git_prompt_char_cleanstate "✔"
	end

	if not set -q __fish_git_prompt_color_dirtystate
		set -g __fish_git_prompt_color_dirtystate yellow
	end
	if not set -q __fish_git_prompt_color_stagedstate
		set -g __fish_git_prompt_color_stagedstate green
	end
	if not set -q __fish_git_prompt_color_invalidstate
		set -g __fish_git_prompt_color_invalidstate red
	end
	if not set -q __fish_git_prompt_color_untrackedfiles
		set -g __fish_git_prompt_color_untrackedfiles cyan
	end
	if not set -q __fish_git_prompt_color_cleanstate
		set -g __fish_git_prompt_color_cleanstate green --bold
	end
	
	set tmp (__fish_vcs_prompt)
	if not test "$tmp" = ""
		#set tmp (string replace -r '\|' ' [' $tmp)
		#set tmp (string replace -r '\(' '' $tmp)
		#set tmp (string replace -r '\)' ']' $tmp)
		prompt_segment normal white "on"
		set_color normal
		printf '%s ' $tmp
	end
end

# Show prompt w/ status cue
function show_prompt -d "Shows prompt with cue for last return status"
	if [ $RETVAL -ne 0 ]
		prompt_segment normal red "\$ "
	else
		prompt_segment normal white "\$ "
	end
end

## Show prompt
function fish_prompt
	set -g RETVAL $status
	echo -e ''
	show_ssh
	show_virtualenv
#	if not command git rev-parse --is-inside-work-tree >/dev/null 2>&1
#		show_user
#	end
	show_user
	show_pwd
	show_git_status
	echo -e ''
	show_prompt
	set_color normal
end

