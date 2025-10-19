#compdef uvx

autoload -U is-at-least

_uvx() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'--from=[Use the given package to provide the command]:FROM:_default' \
'*-w+[Run with the given packages installed]:WITH:_default' \
'*--with=[Run with the given packages installed]:WITH:_default' \
'*--with-editable=[Run with the given packages installed in editable mode]:WITH_EDITABLE:_default' \
'*--with-requirements=[Run with the packages listed in the given files]:WITH_REQUIREMENTS:_default' \
'*-c+[Constrain versions using the given requirements files]:CONSTRAINTS:_default' \
'*--constraints=[Constrain versions using the given requirements files]:CONSTRAINTS:_default' \
'*-b+[Constrain build dependencies using the given requirements files when building source distributions]:BUILD_CONSTRAINTS:_default' \
'*--build-constraints=[Constrain build dependencies using the given requirements files when building source distributions]:BUILD_CONSTRAINTS:_default' \
'*--overrides=[Override versions using the given requirements files]:OVERRIDES:_default' \
'*--env-file=[Load environment variables from a \`.env\` file]:ENV_FILE:_files' \
'*--index=[The URLs to use when resolving dependencies, in addition to the default index]:INDEX:_default' \
'--default-index=[The URL of the default package index (by default\: <https\://pypi.org/simple>)]:DEFAULT_INDEX:_default' \
'-i+[(Deprecated\: use \`--default-index\` instead) The URL of the Python package index (by default\: <https\://pypi.org/simple>)]:INDEX_URL:_default' \
'--index-url=[(Deprecated\: use \`--default-index\` instead) The URL of the Python package index (by default\: <https\://pypi.org/simple>)]:INDEX_URL:_default' \
'*--extra-index-url=[(Deprecated\: use \`--index\` instead) Extra URLs of package indexes to use, in addition to \`--index-url\`]:EXTRA_INDEX_URL:_default' \
'*-f+[Locations to search for candidate distributions, in addition to those found in the registry indexes]:FIND_LINKS:_default' \
'*--find-links=[Locations to search for candidate distributions, in addition to those found in the registry indexes]:FIND_LINKS:_default' \
'*-P+[Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies \`--refresh-package\`]:UPGRADE_PACKAGE:_default' \
'*--upgrade-package=[Allow upgrades for a specific package, ignoring pinned versions in any existing output file. Implies \`--refresh-package\`]:UPGRADE_PACKAGE:_default' \
'*--reinstall-package=[Reinstall a specific package, regardless of whether it'\''s already installed. Implies \`--refresh-package\`]:REINSTALL_PACKAGE:_default' \
'--index-strategy=[The strategy to use when resolving against multiple index URLs]:INDEX_STRATEGY:((first-index\:"Only use results from the first index that returns a match for a given package name"
unsafe-first-match\:"Search for every package name across all indexes, exhausting the versions from the first index before moving on to the next"
unsafe-best-match\:"Search for every package name across all indexes, preferring the "best" version found. If a package version is in multiple indexes, only look at the entry for the first index"))' \
'--keyring-provider=[Attempt to use \`keyring\` for authentication for index URLs]:KEYRING_PROVIDER:((disabled\:"Do not use keyring for credential lookup"
subprocess\:"Use the \`keyring\` command for credential lookup"))' \
'--resolution=[The strategy to use when selecting between the different compatible versions for a given package requirement]:RESOLUTION:((highest\:"Resolve the highest compatible version of each package"
lowest\:"Resolve the lowest compatible version of each package"
lowest-direct\:"Resolve the lowest compatible version of any direct dependencies, and the highest compatible version of any transitive dependencies"))' \
'--prerelease=[The strategy to use when considering pre-release versions]:PRERELEASE:((disallow\:"Disallow all pre-release versions"
allow\:"Allow all pre-release versions"
if-necessary\:"Allow pre-release versions if all versions of a package are pre-release"
explicit\:"Allow pre-release versions for first-party packages with explicit pre-release markers in their version requirements"
if-necessary-or-explicit\:"Allow pre-release versions if all versions of a package are pre-release, or if the package has an explicit pre-release marker in its version requirements"))' \
'--fork-strategy=[The strategy to use when selecting multiple versions of a given package across Python versions and platforms]:FORK_STRATEGY:((fewest\:"Optimize for selecting the fewest number of versions for each package. Older versions may be preferred if they are compatible with a wider range of supported Python versions or platforms"
requires-python\:"Optimize for selecting latest supported version of each package, for each supported Python version"))' \
'*-C+[Settings to pass to the PEP 517 build backend, specified as \`KEY=VALUE\` pairs]:CONFIG_SETTING:_default' \
'*--config-setting=[Settings to pass to the PEP 517 build backend, specified as \`KEY=VALUE\` pairs]:CONFIG_SETTING:_default' \
'*--config-settings-package=[Settings to pass to the PEP 517 build backend for a specific package, specified as \`PACKAGE\:KEY=VALUE\` pairs]:CONFIG_SETTINGS_PACKAGE:_default' \
'*--no-build-isolation-package=[Disable isolation when building source distributions for a specific package]:NO_BUILD_ISOLATION_PACKAGE:_default' \
'--exclude-newer=[Limit candidate packages to those that were uploaded prior to the given date]:EXCLUDE_NEWER:_default' \
'*--exclude-newer-package=[Limit candidate packages for specific packages to those that were uploaded prior to the given date]:EXCLUDE_NEWER_PACKAGE:_default' \
'--link-mode=[The method to use when installing packages from the global cache]:LINK_MODE:((clone\:"Clone (i.e., copy-on-write) packages from the wheel into the \`site-packages\` directory"
copy\:"Copy packages from the wheel into the \`site-packages\` directory"
hardlink\:"Hard link packages from the wheel into the \`site-packages\` directory"
symlink\:"Symbolically link packages from the wheel into the \`site-packages\` directory"))' \
'*--no-build-package=[Don'\''t build source distributions for a specific package]:NO_BUILD_PACKAGE:_default' \
'*--no-binary-package=[Don'\''t install pre-built wheels for a specific package]:NO_BINARY_PACKAGE:_default' \
'*--refresh-package=[Refresh cached data for a specific package]:REFRESH_PACKAGE:_default' \
'-p+[The Python interpreter to use to build the run environment.]:PYTHON:_default' \
'--python=[The Python interpreter to use to build the run environment.]:PYTHON:_default' \
'--python-platform=[The platform for which requirements should be installed]:PYTHON_PLATFORM:((windows\:"An alias for \`x86_64-pc-windows-msvc\`, the default target for Windows"
linux\:"An alias for \`x86_64-unknown-linux-gnu\`, the default target for Linux"
macos\:"An alias for \`aarch64-apple-darwin\`, the default target for macOS"
x86_64-pc-windows-msvc\:"A 64-bit x86 Windows target"
aarch64-pc-windows-msvc\:"An ARM64 Windows target"
i686-pc-windows-msvc\:"A 32-bit x86 Windows target"
x86_64-unknown-linux-gnu\:"An x86 Linux target. Equivalent to \`x86_64-manylinux_2_28\`"
aarch64-apple-darwin\:"An ARM-based macOS target, as seen on Apple Silicon devices"
x86_64-apple-darwin\:"An x86 macOS target"
aarch64-unknown-linux-gnu\:"An ARM64 Linux target. Equivalent to \`aarch64-manylinux_2_28\`"
aarch64-unknown-linux-musl\:"An ARM64 Linux target"
x86_64-unknown-linux-musl\:"An \`x86_64\` Linux target"
riscv64-unknown-linux\:"A RISCV64 Linux target"
x86_64-manylinux2014\:"An \`x86_64\` target for the \`manylinux2014\` platform. Equivalent to \`x86_64-manylinux_2_17\`"
x86_64-manylinux_2_17\:"An \`x86_64\` target for the \`manylinux_2_17\` platform"
x86_64-manylinux_2_28\:"An \`x86_64\` target for the \`manylinux_2_28\` platform"
x86_64-manylinux_2_31\:"An \`x86_64\` target for the \`manylinux_2_31\` platform"
x86_64-manylinux_2_32\:"An \`x86_64\` target for the \`manylinux_2_32\` platform"
x86_64-manylinux_2_33\:"An \`x86_64\` target for the \`manylinux_2_33\` platform"
x86_64-manylinux_2_34\:"An \`x86_64\` target for the \`manylinux_2_34\` platform"
x86_64-manylinux_2_35\:"An \`x86_64\` target for the \`manylinux_2_35\` platform"
x86_64-manylinux_2_36\:"An \`x86_64\` target for the \`manylinux_2_36\` platform"
x86_64-manylinux_2_37\:"An \`x86_64\` target for the \`manylinux_2_37\` platform"
x86_64-manylinux_2_38\:"An \`x86_64\` target for the \`manylinux_2_38\` platform"
x86_64-manylinux_2_39\:"An \`x86_64\` target for the \`manylinux_2_39\` platform"
x86_64-manylinux_2_40\:"An \`x86_64\` target for the \`manylinux_2_40\` platform"
aarch64-manylinux2014\:"An ARM64 target for the \`manylinux2014\` platform. Equivalent to \`aarch64-manylinux_2_17\`"
aarch64-manylinux_2_17\:"An ARM64 target for the \`manylinux_2_17\` platform"
aarch64-manylinux_2_28\:"An ARM64 target for the \`manylinux_2_28\` platform"
aarch64-manylinux_2_31\:"An ARM64 target for the \`manylinux_2_31\` platform"
aarch64-manylinux_2_32\:"An ARM64 target for the \`manylinux_2_32\` platform"
aarch64-manylinux_2_33\:"An ARM64 target for the \`manylinux_2_33\` platform"
aarch64-manylinux_2_34\:"An ARM64 target for the \`manylinux_2_34\` platform"
aarch64-manylinux_2_35\:"An ARM64 target for the \`manylinux_2_35\` platform"
aarch64-manylinux_2_36\:"An ARM64 target for the \`manylinux_2_36\` platform"
aarch64-manylinux_2_37\:"An ARM64 target for the \`manylinux_2_37\` platform"
aarch64-manylinux_2_38\:"An ARM64 target for the \`manylinux_2_38\` platform"
aarch64-manylinux_2_39\:"An ARM64 target for the \`manylinux_2_39\` platform"
aarch64-manylinux_2_40\:"An ARM64 target for the \`manylinux_2_40\` platform"
aarch64-linux-android\:"An ARM64 Android target"
x86_64-linux-android\:"An \`x86_64\` Android target"
wasm32-pyodide2024\:"A wasm32 target using the Pyodide 2024 platform. Meant for use with Python 3.12"
arm64-apple-ios\:"An ARM64 target for iOS device"
arm64-apple-ios-simulator\:"An ARM64 target for iOS simulator"
x86_64-apple-ios-simulator\:"An \`x86_64\` target for iOS simulator"))' \
'--generate-shell-completion=[]:GENERATE_SHELL_COMPLETION:(bash elvish fish nushell powershell zsh)' \
'--cache-dir=[Path to the cache directory]:CACHE_DIR:_files' \
'--python-preference=[]:PYTHON_PREFERENCE:((only-managed\:"Only use managed Python installations; never use system Python installations"
managed\:"Prefer managed Python installations over system Python installations"
system\:"Prefer system Python installations over managed Python installations"
only-system\:"Only use system Python installations; never use managed Python installations"))' \
'--python-fetch=[Deprecated version of \[\`Self\:\:python_downloads\`\]]:PYTHON_FETCH:((automatic\:"Automatically download managed Python installations when needed"
manual\:"Do not automatically download managed Python installations; require explicit installation"
never\:"Do not ever allow Python downloads"))' \
'(--no-color)--color=[Control the use of color in output]:COLOR_CHOICE:((auto\:"Enables colored output only when the output is going to a terminal or TTY with support"
always\:"Enables colored output regardless of the detected environment"
never\:"Disables colored output"))' \
'*--allow-insecure-host=[Allow insecure connections to a host]:ALLOW_INSECURE_HOST:_default' \
'*--preview-features=[Enable experimental preview features]:PREVIEW_FEATURES:_default' \
'--directory=[Change to the given directory prior to running the command]:DIRECTORY:_files' \
'--project=[Run the command within the given project directory]:PROJECT:_files' \
'--config-file=[The path to a \`uv.toml\` file to use for configuration]:CONFIG_FILE:_files' \
'--isolated[Run the tool in an isolated virtual environment, ignoring any already-installed tools]' \
'--no-env-file[Avoid reading environment variables from a \`.env\` file]' \
'--no-index[Ignore the registry index (e.g., PyPI), instead relying on direct URL dependencies and those provided via \`--find-links\`]' \
'-U[Allow package upgrades, ignoring pinned versions in any existing output file. Implies \`--refresh\`]' \
'--upgrade[Allow package upgrades, ignoring pinned versions in any existing output file. Implies \`--refresh\`]' \
'--no-upgrade[]' \
'--reinstall[Reinstall all packages, regardless of whether they'\''re already installed. Implies \`--refresh\`]' \
'--no-reinstall[]' \
'--pre[]' \
'--no-build-isolation[Disable isolation when building source distributions]' \
'--build-isolation[]' \
'--compile-bytecode[Compile Python files to bytecode after installation]' \
'--no-compile-bytecode[]' \
'--no-sources[Ignore the \`tool.uv.sources\` table when resolving dependencies. Used to lock against the standards-compliant, publishable package metadata, as opposed to using any workspace, Git, URL, or local path sources]' \
'--no-build[Don'\''t build source distributions]' \
'--build[]' \
'--no-binary[Don'\''t install pre-built wheels]' \
'--binary[]' \
'(--offline)--refresh[Refresh all cached data]' \
'(--offline)--no-refresh[]' \
'--show-resolution[Whether to show resolver and installer output from any environment modifications]' \
'-V[Display the uvx version]' \
'--version[Display the uvx version]' \
'-n[Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation]' \
'--no-cache[Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation]' \
'(--python-preference)--managed-python[Require use of uv-managed Python versions]' \
'(--python-preference)--no-managed-python[Disable use of uv-managed Python versions]' \
'--allow-python-downloads[Allow automatically downloading Python when required. \[env\: "UV_PYTHON_DOWNLOADS=auto"\]]' \
'--no-python-downloads[Disable automatic downloads of Python. \[env\: "UV_PYTHON_DOWNLOADS=never"\]]' \
'(-v --verbose)*-q[Use quiet output]' \
'(-v --verbose)*--quiet[Use quiet output]' \
'(-q --quiet)*-v[Use verbose output]' \
'(-q --quiet)*--verbose[Use verbose output]' \
'(--color)--no-color[Disable colors]' \
'--native-tls[Whether to load TLS certificates from the platform'\''s native certificate store]' \
'--no-native-tls[]' \
'--offline[Disable network access]' \
'--no-offline[]' \
'--preview[Whether to enable all experimental preview features]' \
'--no-preview[]' \
'--show-settings[Show the resolved settings for the current command]' \
'--no-progress[Hide all progress outputs]' \
'--no-installer-metadata[Skip writing \`uv\` installer metadata files (e.g., \`INSTALLER\`, \`REQUESTED\`, and \`direct_url.json\`) to site-packages \`.dist-info\` directories]' \
'--no-config[Avoid discovering configuration files (\`pyproject.toml\`, \`uv.toml\`)]' \
'-h[Display the concise help for this command]' \
'--help[Display the concise help for this command]' \
"*::external_command:_default" \
&& ret=0
}

(( $+functions[_uvx_commands] )) ||
_uvx_commands() {
    local commands; commands=()
    _describe -t commands 'uvx commands' commands "$@"
}

if [ "$funcstack[1]" = "_uvx" ]; then
    _uvx "$@"
else
    compdef _uvx uvx
fi
