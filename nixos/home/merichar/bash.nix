{ ... }:

{
  programs.bash = {
    enable = true;

    # Negative values tell Bash not to limit either the live history or the
    # history file. The existing file is intentionally preserved in place.
    historySize = -1;
    historyFileSize = -1;
    historyControl = [ "ignoreboth" ];

    # Preserve the established behavior instead of inheriting Home Manager's
    # broader defaults, which also enable extglob, globstar, and checkjobs.
    shellOptions = [
      "histappend"
      "checkwinsize"
    ];

    shellAliases = {
      cal = "cal -3";
      grep = "grep --color=auto";
      ls = "ls --color=auto --group-directories-first -F";
      mv = "mv -i";
      rm = "rm -i";
    };

    initExtra = ''
      # Recursive finds with time and size, respectively, in the output.
      findt() { find "$@" -printf '%T+ %p\n'; }
      finds() { find "$@" -printf '%s %p\n'; }

      # Preserve the prompt and terminal-title behavior from the working host,
      # with a plain fallback for terminals that do not support color.
      if [[ "$TERM" != dumb ]] && tput setaf 1 &>/dev/null; then
        PS1='[\[\033[00;34m\]\u\[\033[00m\]@\[\033[00;34m\]\h\[\033[00m\] \[\033[00;32m\]\w\[\033[00m\]]\$ '
      else
        PS1='\u@\h:\w\$ '
      fi
      case "$TERM" in
        xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
      esac
    '';
  };
}
