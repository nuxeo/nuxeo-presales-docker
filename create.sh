#!/bin/bash

# Error control
set -euf -o pipefail

# Source files
# Ref: https://stackoverflow.com/questions/59895/
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

### Dynamic Defaults go here
APPLICATION_NAME=${APPLICATION_NAME:-$(basename $PWD)}
_PRINT_HELP="yes"
###

#
# ArgBash Template: https://argbash.io/send_template#generated
#
# ARG_OPTIONAL_SINGLE([dir], [d], [Creation directory, defaults to current working directory], [${PWD}])
# ARG_OPTIONAL_SINGLE([application], [a], [Application (Studio) project name], [${APPLICATION_NAME}])

# ARG_OPTIONAL_SINGLE([user], [u], [Studio username], [${USER}])
# ARG_OPTIONAL_SINGLE([pass], [p], [Studio password, will be read from command line if not provided])

# ARG_OPTIONAL_SINGLE([version], [v], [Nuxeo version (from Docker Hub)], [latest])
# ARG_OPTIONAL_SINGLE([host], [o], [Specify Nuxeo hostname], [localhost])
# ARG_OPTIONAL_SINGLE([port], [l], [Listen on specified port], [8080])
# ARG_OPTIONAL_REPEATED([template], [t], [Add configuration template], [])

# ARG_OPTIONAL_SINGLE([mp-opts], [m], [Nuxeo Marketplace Install options], [--relax=false])

# ARG_OPTIONAL_SINGLE([nxuser], , [(Advanced) Nuxeo runtime user], [nuxeo])
# ARG_OPTIONAL_BOOLEAN([nxhotfix], , [(Advanced) Apply HotFix packages'], [on])
# ARG_OPTIONAL_SINGLE([nxdata], , [(Advanced) Nuxeo data directory], [/var/lib/nuxeo/data])
# ARG_OPTIONAL_SINGLE([nxlog], , [(Advanced) Nuxeo log directory], [/var/log/nuxeo])

# ARG_OPTIONAL_BOOLEAN([verbose], , [Verbose output])

# ARG_POSITIONAL_INF([packages], [Packages to include, in addition to application-name])

# ARG_HELP([Nuxeo Docker Environment Generator])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.9.0 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate


die()
{
	local _ret="${2:-1}"
	test "${_PRINT_HELP:-no}" = yes && print_help >&2
	echo "$1" >&2
	exit "${_ret}"
}


begins_with_short_option()
{
	local first_option all_short_options='daupvoltmh'
	first_option="${1:0:1}"
	test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}

# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_packages=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_dir="${PWD}"
_arg_application="${APPLICATION_NAME}"
_arg_user="${USER}"
_arg_pass=
_arg_version="latest"
_arg_host="localhost"
_arg_port="8080"
_arg_template=()
_arg_mp_opts="--relax=false"
_arg_nxuser="nuxeo"
_arg_nxhotfix="on"
_arg_nxdata="/var/lib/nuxeo/data"
_arg_nxlog="/var/log/nuxeo"
_arg_verbose="off"


print_help()
{
	printf '%s\n' "Nuxeo Docker Environment Generator"
	printf 'Usage: %s [-d|--dir <arg>] [-a|--application <arg>] [-u|--user <arg>] [-p|--pass <arg>] [-v|--version <arg>] [-o|--host <arg>] [-l|--port <arg>] [-t|--template <arg>] [-m|--mp-opts <arg>] [--nxuser <arg>] [--(no-)nxhotfix] [--nxdata <arg>] [--nxlog <arg>] [--(no-)verbose] [-h|--help] [<packages-1>] ... [<packages-n>] ...\n' "$0"
	printf '\t%s\n' "<packages>: Packages to include, in addition to application-name"
	printf '\t%s\n' "-d, --dir: Creation directory, defaults to current working directory (default: '${PWD}')"
	printf '\t%s\n' "-a, --application: Application (Studio) project name (default: '${APPLICATION_NAME}')"
	printf '\t%s\n' "-u, --user: Studio username (default: '${USER}')"
	printf '\t%s\n' "-p, --pass: Studio password, will be read from command line if not provided (no default)"
	printf '\t%s\n' "-v, --version: Nuxeo version (from Docker Hub) (default: 'latest')"
	printf '\t%s\n' "-o, --host: Specify Nuxeo hostname (default: 'localhost')"
	printf '\t%s\n' "-l, --port: Listen on specified port (default: '8080')"
	printf '\t%s\n' "-t, --template: Add configuration template (empty by default)"
	printf '\t%s\n' "-m, --mp-opts: Nuxeo Marketplace Install options (default: '--relax=false')"
	printf '\t%s\n' "--nxuser: (Advanced) Nuxeo runtime user (default: 'nuxeo')"
	printf '\t%s\n' "--nxhotfix, --no-nxhotfix: (Advanced) Apply HotFix packages' (on by default)"
	printf '\t%s\n' "--nxdata: (Advanced) Nuxeo data directory (default: '/var/lib/nuxeo/data')"
	printf '\t%s\n' "--nxlog: (Advanced) Nuxeo log directory (default: '/var/log/nuxeo')"
	printf '\t%s\n' "--verbose, --no-verbose: Verbose output (off by default)"
	printf '\t%s\n' "-h, --help: Prints help"
}


parse_commandline()
{
	_positionals_count=0
	while test $# -gt 0
	do
		_key="$1"
		case "$_key" in
			-d|--dir)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_dir="$2"
				shift
				;;
			--dir=*)
				_arg_dir="${_key##--dir=}"
				;;
			-d*)
				_arg_dir="${_key##-d}"
				;;
			-a|--application)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_application="$2"
				shift
				;;
			--application=*)
				_arg_application="${_key##--application=}"
				;;
			-a*)
				_arg_application="${_key##-a}"
				;;
			-u|--user)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_user="$2"
				shift
				;;
			--user=*)
				_arg_user="${_key##--user=}"
				;;
			-u*)
				_arg_user="${_key##-u}"
				;;
			-p|--pass)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_pass="$2"
				shift
				;;
			--pass=*)
				_arg_pass="${_key##--pass=}"
				;;
			-p*)
				_arg_pass="${_key##-p}"
				;;
			-v|--version)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_version="$2"
				shift
				;;
			--version=*)
				_arg_version="${_key##--version=}"
				;;
			-v*)
				_arg_version="${_key##-v}"
				;;
			-o|--host)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_host="$2"
				shift
				;;
			--host=*)
				_arg_host="${_key##--host=}"
				;;
			-o*)
				_arg_host="${_key##-o}"
				;;
			-l|--port)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_port="$2"
				shift
				;;
			--port=*)
				_arg_port="${_key##--port=}"
				;;
			-l*)
				_arg_port="${_key##-l}"
				;;
			-t|--template)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_template+=("$2")
				shift
				;;
			--template=*)
				_arg_template+=("${_key##--template=}")
				;;
			-t*)
				_arg_template+=("${_key##-t}")
				;;
			-m|--mp-opts)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_mp_opts="$2"
				shift
				;;
			--mp-opts=*)
				_arg_mp_opts="${_key##--mp-opts=}"
				;;
			-m*)
				_arg_mp_opts="${_key##-m}"
				;;
			--nxuser)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_nxuser="$2"
				shift
				;;
			--nxuser=*)
				_arg_nxuser="${_key##--nxuser=}"
				;;
			--no-nxhotfix|--nxhotfix)
				_arg_nxhotfix="on"
				test "${1:0:5}" = "--no-" && _arg_nxhotfix="off"
				;;
			--nxdata)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_nxdata="$2"
				shift
				;;
			--nxdata=*)
				_arg_nxdata="${_key##--nxdata=}"
				;;
			--nxlog)
				test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
				_arg_nxlog="$2"
				shift
				;;
			--nxlog=*)
				_arg_nxlog="${_key##--nxlog=}"
				;;
			--no-verbose|--verbose)
				_arg_verbose="on"
				test "${1:0:5}" = "--no-" && _arg_verbose="off"
				;;
			-h|--help)
				print_help
				exit 0
				;;
			-h*)
				print_help
				exit 0
				;;
			*)
				_last_positional="$1"
				_positionals+=("$_last_positional")
				_positionals_count=$((_positionals_count + 1))
				;;
		esac
		shift
	done
}


assign_positional_args()
{
	local _positional_name _shift_for=$1
	_positional_names=""
	_our_args=$((${#_positionals[@]} - 0))
	for ((ii = 0; ii < _our_args; ii++))
	do
		_positional_names="$_positional_names _arg_packages[$((ii + 0))]"
	done

	shift "$_shift_for"
	for _positional_name in ${_positional_names}
	do
		test $# -gt 0 || break
		eval "$_positional_name=\${1}" || die "Error during argument parsing, possibly an Argbash bug." 1
		shift
	done
}

parse_commandline "$@"
assign_positional_args 1 "${_positionals[@]}"

# OTHER STUFF GENERATED BY Argbash

### END OF CODE GENERATED BY Argbash (sortof) ### ])
# [ <-- needed because of Argbash
# ] <-- needed because of Argbash

# Check for existing files
if [[ -e ${_arg_dir}/docker-compose.yml ]]; then
  echo "[Warn] Directory contains an existing configuration: ${_arg_dir}"
  while true; do
    read -p "Do you wish to overwrite? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
  done
  rm -f ${_arg_dir}/docker-compose.yml ${_arg_dir}/docker-compose-dev.yml ${_arg_dir}/docker-sync.yml ${_arg_dir}/.env
fi

# Check for missing directory
if [ ! -d ${_arg_dir}/init ]; then
  mkdir -p ${_arg_dir}/init
fi

# Check for Studio credentials
if [ -z "${_arg_pass}" ]; then
  read -s -p "Studio Password: " _arg_pass
  echo ""
fi

# Check port, auto assign if '0'
if [ "${_arg_port}" = "0" ]; then
  PNUM=$RANDOM;
  let "PNUM %= 3001";
  _arg_port=$(($PNUM+6999));
  echo "Using port number ${_arg_port}";
fi

# Set local environment from arguments
APPLICATION_NAME=${_arg_application}
NUXEO_VERSION=${_arg_version}
NUXEO_PORT=${_arg_port}
NUXEO_PACKAGES=${_arg_packages[@]:-}
NUXEO_TEMPLATES=${_arg_template[@]:-}

STUDIO_USERNAME=${_arg_user}
STUDIO_CREDENTIALS=${_arg_pass}

NUXEO_HOSTNAME=${_arg_host}
NUXEO_PORT=${_arg_port}
NUXEO_MPINSTALL_OPTIONS=${_arg_mp_opts}
NUXEO_INSTALL_HOTFIX=${_arg_nxhotfix}
NUXEO_DATA=${_arg_nxdata}
NUXEO_LOG=${_arg_nxlog}
NUXEO_USER=${_arg_nxuser}

# Apply environment template
apply_shell_expansion() {
    declare file="$1"
    declare data=$(< "$file")
    declare delimiter="__sep__"
    declare command="cat <<$delimiter"$'\n'"$data"$'\n'"$delimiter"
    eval "$command"
}

printf "%s\n" "$(apply_shell_expansion ${DIR}/env)" > ${_arg_dir}/.env
printf "%s\n" "$(apply_shell_expansion ${DIR}/docker-compose-dev.yml)" > ${_arg_dir}/docker-compose-dev.yml
printf "%s\n" "$(apply_shell_expansion ${DIR}/docker-sync.yml)" > ${_arg_dir}/docker-sync.yml

if [ ! -e ${_arg_dir}/init/nuxeo.conf ]; then
  printf "%s\n" "$(apply_shell_expansion ${DIR}/init/nuxeo.conf)" > ${_arg_dir}/init/nuxeo.conf
else
  echo "[Info] Existing 'nuxeo.conf' will not be overwritten."
fi

if [ ${_arg_verbose} == "on" ]; then
  echo -e "Nuxeo Configuration:"
  echo "-- BEGIN --"
  cat ${_arg_dir}/.env
  echo "-- END --"
fi

# Copy template files
cp ${DIR}/docker-compose.yml ${_arg_dir}
if [ ! -e ${_arg_dir}/init/0_register.sh ]; then
  cp ${DIR}/init/0_register.sh ${_arg_dir}/init/
  chmod +x ${_arg_dir}/init/0_register.sh
else
  echo "[Info] Existing '0_register.sh' will not be overwritten."
fi

# Done
