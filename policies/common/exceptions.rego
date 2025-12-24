package common.exceptions

is_exception(policy, resource) {
  exc := input.metadata.exceptions[_]
  exc.policy == policy
  exc.resource == resource
  not expired(exc.expires)
}

expired(date) {
  time.parse_rfc3339_ns(date) < time.now_ns()
}
