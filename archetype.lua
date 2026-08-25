-- golang-ci-library standalone entry point.
--
-- Parents consuming this library should depend on it with `library: true`
-- and call `require("golang-ci").render(context, { destination = "project-name" })`.
-- This script runs when the archetype is invoked directly to retrofit an
-- existing project:
--
--   archetect render .../golang-ci-library <project-dir>

local context = Context.new()
require("lib").render(context)
return context
