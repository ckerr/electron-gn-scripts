#!/usr/bin/env bash

set -e

basedir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
source "$basedir/__load-config.sh"
source "$basedir/__tools.sh"
ensure_depot_tools
 
readonly src_path="$ELECTRON_GN_ROOT/src"
echo -e "Running '${COLOR_CMD}gn gen${COLOR_OFF}' in '${COLOR_DIR}$src_path${COLOR_OFF}'"
cd "$src_path"
PATH="$DEPOT_TOOLS_PATH:$PATH" gn gen "out/$ELECTRON_OUT_DIR" --args="import(\"//electron/build/args/$GN_IMPORT_NAME.gn\") cc_wrapper=\"$ELECTRON_GN_ROOT/src/electron/external_binaries/sccache\" $EXTRA_GN_ARGS"
