if ! [[ -n "$(command -v duti)" ]]; then
  brew install duti
fi

# each array contains all matches for default apps to open the file
extensions=(.zsh .sh .js .jsx .ts .tsx .cjs .mjs .json .json5 .md .txt .java .kt .py .lock .rb .yml .yaml .xml m3u m3u8 m4d mpd)
files=(Podfile)
assets=(.svg)

vscode_id="com.microsoft.VSCode"

# Use duti to set macosx default apps for each extension
set_vscode_default(){
  echo setup extensions for $vscode_id: ${extensions[*]}
  for val in "${extensions[@]}" 
  do
    duti -s $vscode_id $val all
  done


  echo setup files for $vscode_id: ${files[*]}
  for val in "${extensions[@]}" 
  do
    duti -s $vscode_id $val all
  done

  echo setup assets for $vscode_id ${assets[*]}
  for val in "${extensions[@]}" 
  do
    duti -s $vscode_id $val all
  done
}

set_vscode_default