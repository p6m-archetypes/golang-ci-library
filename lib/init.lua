-- golang-ci-library main module.
--
-- Generates GitHub Actions CI workflows for Go service archetypes:
--   .github/workflows/build.yaml     — CI build on every push and PR
--   .github/workflows/cut-tag.yaml   — manual workflow_dispatch release tagging
--
-- Uses community actions: actions/setup-go@v5, mathieudutour/github-tag-action@v6.2
--
-- API (called from a parent archetype):
--   local ci = require("golang-ci")
--   ci.render(context, { destination = context:get("project-name") })
--
-- Standalone retrofit (runs when archetype is invoked directly):
--   archetect render .../golang-ci-library <project-dir>
--
-- Context contract (no required keys — workflows are project-name-agnostic).

local M = {}

-- Render CI workflow files.
-- opts.destination — project subdirectory under the archetect destination root
--   (e.g. "billing-service"). Omit when running standalone with destination
--   already set to the project directory.
function M.render(context, opts)
    opts = opts or {}
    local d = opts.destination
    if d and d ~= "" then
        directory.render("contents", context, { destination = d })
    else
        directory.render("contents", context)
    end
    return context
end

return M
