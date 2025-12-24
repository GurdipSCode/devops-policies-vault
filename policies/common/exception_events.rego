package common.exception_events

exception[event] {
  exc := input.metadata.exceptions[_]
  not expired(exc.expires)

  event := {
    "event_type": "opa_exception_used",
    "policy": exc.policy,
    "resource": exc.resource,
    "reason": exc.reason,
    "expires": exc.expires,
    "actor": input.metadata.actor,
    "source": input.metadata.source,
    "repo": input.metadata.repo,
    "commit": input.metadata.commit,
    "timestamp": time.now_ns()
  }
}

expired(date) {
  time.parse_rfc3339_ns(date) < time.now_ns()
}
