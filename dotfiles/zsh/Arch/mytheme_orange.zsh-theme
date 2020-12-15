PROMPT='${ret_status} %{%F{208}%}%~%{%f%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{%B%F{178}%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{%B%F{178}%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%B%F{178}%})"

LS_COLORS=''
LS_COLORS+='di=33'
LS_COLORS+=':ln=35'
LS_COLORS+=':so=32'
LS_COLORS+=':pi=92'
LS_COLORS+=':ex=31'
LS_COLORS+=':bd=46;33'
LS_COLORS+=':cd=43;33'
LS_COLORS+=':su=41;31'
LS_COLORS+=':sg=46;31'
LS_COLORS+=':tw=42;31'
LS_COLORS+=':ow=43;31'
