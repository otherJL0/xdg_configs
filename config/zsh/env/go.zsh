# Controls whether the go command runs in module-aware mode or GOPATH mode.
# May be "off", "on", or "auto".
# See https://golang.org/ref/mod#mod-commands.
export GO111MODULE=on

# The gccgo command to run for 'go build -compiler=gccgo'.
# GCCGO

# The architecture, or processor, for which to compile code.
# Examples are amd64, 386, arm, ppc64.
export GOARCH=amd64

# The directory where 'go install' will install a command.
export GOBIN="$HOME/.go/bin"

# The directory where the go command will store cached
# information for reuse in future builds.
export GOCACHE=$XDG_CACHE_HOME/go

# The directory where the go command will store downloaded modules.
export GOMODCACHE=$XDG_CACHE_HOME/gomod

# Enable various debugging facilities. See 'go doc runtime'
# for details.
# GODEBUG

# The location of the Go environment configuration file.
# Cannot be set using 'go env -w'.
# GOENV

# A space-separated list of -flag=value settings to apply
# to go commands by default, when the given flag is known by
# the current command. Each entry must be a standalone flag.
# Because the entries are space-separated, flag values must
# not contain spaces. Flags listed on the command line
# are applied after this list and therefore override it.
# GOFLAGS

# Comma-separated list of glob patterns (in the syntax of Go's path.Match)
# of module path prefixes that should always be fetched in an insecure
# manner. Only applies to dependencies that are being fetched directly.
# GOINSECURE does not disable checksum database validation. GOPRIVATE or
# GONOSUMDB may be used to achieve that.
# GOINSECURE

# The operating system for which to compile code.
# Examples are linux, darwin, windows, netbsd.
export GOOS=linux

# For more details see: 'go help gopath'.
# GOPATH

# URL of Go module proxy. See https://golang.org/ref/mod#environment-variables
# and https://golang.org/ref/mod#module-proxy for details.
# GOPROXY

# Comma-separated list of glob patterns (in the syntax of Go's path.Match)
# of module path prefixes that should always be fetched directly
# or that should not be compared against the checksum database.
# See https://golang.org/ref/mod#private-modules.
# GOPRIVATE, GONOPROXY, GONOSUMDB

# The root of the go tree.
# GOROOT

# The name of checksum database to use and optionally its public key and
# URL. See https://golang.org/ref/mod#authenticating.
# GOSUMDB

# The directory where the go command will write
# temporary source files, packages, and binaries.
# GOTMPDIR

# Lists version control commands that may be used with matching servers.
# See 'go help vcs'.
# GOVCS
