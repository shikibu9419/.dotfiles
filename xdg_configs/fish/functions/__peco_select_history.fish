function __peco_select_history
  history merge
  commandline | read -l buffer
  history | peco --query "$buffer" | read -l command

  if [ $command ]
    commandline $command
  else
    commandline ''
  end
end
