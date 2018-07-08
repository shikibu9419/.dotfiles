function peco_ghq
  commandline | read -l buffer
  ghq list --full-path | \
    sed -e "s|$HOME/||g" | \
    peco --query "$buffer" | \
    read -l repository_path
  if [ -n "$repository_path" ]
    commandline "cd ~/$repository_path"
    commandline -f execute
  end
  commandline -f repaint
end
