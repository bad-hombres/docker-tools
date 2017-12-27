if [[ "$1" == "stop" ]]; then
  stop-image $IMAGE_NAME
  exit 0
else
  run-image $IMAGE_NAME "$OPTS" "$*"
fi
