-- ============================================================
-- Custom LuaSnip Snippets — Terraform, Shell, Python
-- ============================================================
local ls    = require("luasnip")
local s     = ls.snippet
local t     = ls.text_node
local i     = ls.insert_node
local f     = ls.function_node
local fmt   = require("luasnip.extras.fmt").fmt

-- ── Terraform / HCL ────────────────────────────────────────
ls.add_snippets("terraform", {
  s("res", fmt([=[
resource "{}" "{}" {{
  {}
}}
]=], { i(1, "aws_instance"), i(2, "example"), i(3, "# configuration") })),

  s("var", fmt([=[
variable "{}" {{
  description = "{}"
  type        = {}
  default     = {}
}}
]=], { i(1, "name"), i(2, "Description"), i(3, "string"), i(4, '""') })),

  s("out", fmt([=[
output "{}" {{
  description = "{}"
  value       = {}
}}
]=], { i(1, "name"), i(2, "Description"), i(3, "module.example.id") })),

  s("mod", fmt([=[
module "{}" {{
  source  = "{}"
  version = "{}"

  {}
}}
]=], { i(1, "name"), i(2, "./modules/example"), i(3, "1.0.0"), i(4, "# inputs") })),

  s("data", fmt([=[
data "{}" "{}" {{
  {}
}}
]=], { i(1, "aws_ami"), i(2, "example"), i(3, "# filters") })),

  s("prov", fmt([=[
provider "{}" {{
  region = "{}"
}}
]=], { i(1, "aws"), i(2, "us-east-1") })),

  s("backend", fmt([=[
terraform {{
  backend "{}" {{
    bucket = "{}"
    key    = "{}"
    region = "{}"
  }}
}}
]=], { i(1, "s3"), i(2, "my-tf-state"), i(3, "terraform.tfstate"), i(4, "us-east-1") })),
})

-- Also register for hcl filetype
ls.add_snippets("hcl", ls.get_snippets("terraform"))

-- ── Shell / Bash ────────────────────────────────────────────
ls.add_snippets("sh", {
  s("shebang", t({ "#!/usr/bin/env bash", "set -euo pipefail", "", "" })),

  s("if", fmt([=[
if [[ {} ]]; then
  {}
fi
]=], { i(1, "condition"), i(2, "echo 'true'") })),

  s("for", fmt([=[
for {} in {}; do
  {}
done
]=], { i(1, "item"), i(2, '"${array[@]}"'), i(3, 'echo "$item"') })),

  s("func", fmt([=[
{}() {{
  local {} = "${{1:?}}"
  {}
}}
]=], { i(1, "function_name"), i(2, "arg"), i(3, "echo \"doing work\"") })),

  s("while", fmt([=[
while {}; do
  {}
done
]=], { i(1, "true"), i(2, "# body") })),

  s("case", fmt([=[
case "${}" in
  {})
    {}
    ;;
  *)
    echo "Unknown option"
    ;;
esac
]=], { i(1, "1"), i(2, "start"), i(3, 'echo "starting"') })),

  s("log", fmt([=[
log() {{
  echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"
}}
]=], {})),
})

-- Also register for bash filetype
ls.add_snippets("bash", ls.get_snippets("sh"))

-- ── Python ──────────────────────────────────────────────────
ls.add_snippets("python", {
  s("main", fmt([=[
def main():
    {}


if __name__ == "__main__":
    main()
]=], { i(1, "pass") })),

  s("def", fmt([=[
def {}({}) -> {}:
    """{}"""
    {}
]=], { i(1, "function_name"), i(2, "args"), i(3, "None"), i(4, "Docstring."), i(5, "pass") })),

  s("class", fmt([=[
class {}:
    """{}"""

    def __init__(self, {}):
        {}
]=], { i(1, "ClassName"), i(2, "Class docstring."), i(3, "self"), i(4, "pass") })),

  s("ifmain", t({ 'if __name__ == "__main__":', "    main()" })),

  s("try", fmt([=[
try:
    {}
except {} as e:
    {}
]=], { i(1, "pass"), i(2, "Exception"), i(3, 'print(f"Error: {e}")') })),

  s("argparse", fmt([=[
import argparse

def parse_args():
    parser = argparse.ArgumentParser(description="{}")
    parser.add_argument("{}", type={}, help="{}")
    return parser.parse_args()
]=], { i(1, "Script description"), i(2, "--name"), i(3, "str"), i(4, "Help text") })),

  s("log", fmt([=[
import logging

logging.basicConfig(level=logging.{}, format="%(asctime)s - %(name)s - %(levelname)s - %(message)s")
logger = logging.getLogger(__name__)
]=], { i(1, "INFO") })),
})
