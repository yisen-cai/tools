cd codelabs || exit
PWD=$(pwd)
FILES=($(ls))
for FILE in "${FILES[@]}"; do
  FILENAME="$PWD/$FILE"
  if [ -d "$FILENAME" ]; then
    echo "skip directory"
  else
    $(claat export $FILENAME)
  fi
done
