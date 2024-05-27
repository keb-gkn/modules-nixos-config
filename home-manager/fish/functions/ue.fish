function ue
  set -g ue4cli "/usr/bin/ue4"
  set -g engine_path ($ue4cli root)

  if test $argv[1] = "engine"
    cd $engine_path
  else if test $argv[1] = "rebuild"
    $ue4cli clean
    $ue4cli build
    if test $argv[1] = "run"
      $ue4cli run
    end
  else if test $argv[1] = "build"
    if test $argv[-1] = "run"
      $ue4cli build $argv[2..-2]
      $ue4cli run
    else
      $ue4cli build $argv[2..-1]
    end
  else if test $argv[1] = "gen"
    $ue4cli gen
    set -l project (string split / $PWD)[-1]
    python -c 'import json,sys
arg = [x for x in sys.argv if ".vscode" in x][0]
f = open(arg)
j = json.load(f)
for o in j:
    file = o["file"]
    arg = o["arguments"][1]
    o["arguments"] = ["clang++ -std=c++20 -ferror-limit=0 -Wall -Wextra -Wpedantic -Wshadow-all -Wno-unused-parameter " + file + " " + arg]
print(json.dumps(j, indent=2))
f.close()' "$PWD/.vscode/compileCommands_$project.json" > compile_commands.json

    python -c 'import json,sys
arg = [x for x in sys.argv if ".vscode" in x][0]
f = open(arg)
j = json.load(f)
for o in j["configurations"]:
    o["type"] = "lldb"
print(json.dumps(j, indent=2))
f.close()' "$PWD/.vscode/launch.json" > .vscode/launch.new.json
    mv -f .vscode/launch.new.json .vscode/launch.json
  else
    $ue4cli $argv
  end
end
