# Create dir and cd into it
mkcd () {
  mkdir "$1"
  cd "$1"
}
# Call cht.sh
cht (){
  curl "https://cheat.sh/${*// /\/}"
}
