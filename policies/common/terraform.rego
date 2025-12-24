package common.terraform

is_create_or_update(rc) {
  rc.change.actions[_] == "create"
} else {
  rc.change.actions[_] == "update"
}

after(rc) := rc.change.after
