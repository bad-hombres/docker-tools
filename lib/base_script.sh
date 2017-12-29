if [[ "$1" == "stop" ]]; then
  stop-image $IMAGE_NAME
  exit 0
elif [[ "$1" == "update" ]]; then
  update-image $IMAGE_NAME
else
  if [[ "$MOUNT_HOME_DIR" == "true" ]]; then
    EXTRA_OPTS="$EXTRA_OPTS -v $HOME:$HOME"
  fi
  run-image $IMAGE_NAME "$OPTS $EXTRA_OPTS" "$*"
fi
