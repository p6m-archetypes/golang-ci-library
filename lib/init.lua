-- golang-ci-library main module.
--
-- Generates GitHub Actions CI workflows for Go service archetypes:
--   .github/workflows/build.yaml     — the one pipeline: PR + main builds, and manual minor/major releases via workflow_dispatch (version-level)
--   .github/workflows/promote.yaml   — manual workflow_dispatch promotion of a release to stg/prd
--
-- Uses p6m-actions: golang-setup@v1, golang-build@v1, golang-cut-tag@v1
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
