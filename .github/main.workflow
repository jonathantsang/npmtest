workflow "build and test" {
  on = "push"
  resolves = ["test", "coverage", "lint"]
}

action "build" {
  uses = "actions/npm@master"
  args = "ci"
}

action "test" {
  needs = "build"
  uses = "actions/npm@master"
  args = "t"
}

action "coverage" {
  needs = "build"
  uses = "actions/npm@master"
  args = "run coverage"
}

action "lint" {
  needs = "build"
  uses = "actions/npm@master"
  args = "run lint"
}

workflow "publish on release" {
  on = "release"
  resolves = ["publish"]
}

action "publish" {
  uses = "actions/npm@master"
  args = "publish"
  secrets = ["52fb5277-ad10-4b97-abdb-9b7ac407f366"]
}
