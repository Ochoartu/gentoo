# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler-1.0.2
	ahash-0.7.6
	ahash-0.8.1
	aho-corasick-0.7.18
	android_system_properties-0.1.4
	anyhow-1.0.62
	arc-swap-1.5.1
	arrayvec-0.7.2
	async-broadcast-0.5.0
	async-executor-1.5.0
	async-io-1.12.0
	async-lock-2.6.0
	async-recursion-1.0.0
	async-task-4.3.0
	async-trait-0.1.59
	atoi-2.0.0
	autocfg-1.1.0
	base64-0.13.0
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.9.0
	block-buffer-0.10.2
	bstr-1.3.0
	btoi-0.4.2
	bumpalo-3.11.0
	byteorder-1.4.3
	bytesize-1.1.0
	castaway-0.2.2
	cc-1.0.73
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.23
	clap-4.1.6
	clap_complete-4.1.3
	clap_derive-4.1.0
	clap_lex-0.3.0
	clru-0.6.1
	cmake-0.1.48
	compact_str-0.6.1
	concurrent-queue-2.0.0
	const_format-0.2.26
	const_format_proc_macros-0.2.22
	core-foundation-0.7.0
	core-foundation-sys-0.7.0
	core-foundation-sys-0.8.3
	cpufeatures-0.2.4
	crc32fast-1.3.2
	crossbeam-0.8.2
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.10
	crossbeam-queue-0.3.8
	crossbeam-utils-0.8.11
	crypto-common-0.1.6
	dashmap-5.3.4
	deelevate-0.2.0
	derivative-2.2.0
	difflib-0.4.0
	digest-0.9.0
	digest-0.10.6
	dirs-2.0.2
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dlv-list-0.3.0
	downcast-0.11.0
	dunce-1.0.3
	dyn-clone-1.0.9
	either-1.8.0
	enumflags2-0.7.5
	enumflags2_derive-0.7.4
	errno-0.2.8
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fastrand-1.8.0
	filedescriptor-0.8.2
	filetime-0.2.17
	flate2-1.0.24
	float-cmp-0.9.0
	fnv-1.0.7
	form_urlencoded-1.0.1
	fragile-1.2.1
	futures-core-0.3.25
	futures-io-0.3.23
	futures-lite-1.12.0
	futures-sink-0.3.25
	futures-task-0.3.25
	futures-util-0.3.25
	generic-array-0.14.6
	gethostname-0.4.1
	getrandom-0.1.16
	getrandom-0.2.7
	gix-0.37.2
	gix-actor-0.17.2
	gix-attributes-0.8.3
	gix-bitmap-0.2.1
	gix-chunk-0.4.1
	gix-command-0.2.4
	gix-config-0.16.3
	gix-config-value-0.10.1
	gix-credentials-0.9.2
	gix-date-0.4.3
	gix-diff-0.26.3
	gix-discover-0.13.1
	gix-features-0.26.5
	gix-glob-0.5.5
	gix-hash-0.10.3
	gix-hashtable-0.1.1
	gix-index-0.12.4
	gix-lock-3.0.2
	gix-mailmap-0.9.3
	gix-object-0.26.4
	gix-odb-0.40.2
	gix-pack-0.30.3
	gix-path-0.7.2
	gix-prompt-0.3.2
	gix-quote-0.4.2
	gix-ref-0.24.1
	gix-refspec-0.7.3
	gix-revision-0.10.4
	gix-sec-0.6.2
	gix-tempfile-3.0.2
	gix-traverse-0.22.2
	gix-url-0.13.3
	gix-validate-0.7.3
	gix-worktree-0.12.3
	guess_host_triple-0.1.3
	hashbrown-0.12.3
	hashbrown-0.13.1
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hex-0.4.3
	home-0.5.4
	human_format-1.0.3
	iana-time-zone-0.1.46
	idna-0.2.3
	imara-diff-0.1.5
	indexmap-1.9.2
	instant-0.1.12
	io-close-0.3.7
	io-lifetimes-1.0.1
	is-terminal-0.4.1
	is_debug-1.0.1
	itertools-0.10.5
	itoa-1.0.3
	js-sys-0.3.59
	jwalk-0.8.1
	lazy_static-1.4.0
	lazycell-1.3.0
	libc-0.2.137
	libz-ng-sys-1.1.8
	libz-sys-1.1.8
	linked-hash-map-0.5.6
	linux-raw-sys-0.1.3
	lock_api-0.4.8
	log-0.4.17
	mac-notification-sys-0.5.6
	mach-0.3.2
	malloc_buf-0.0.6
	matches-0.1.9
	memchr-2.5.0
	memmap2-0.5.7
	memmem-0.1.1
	memoffset-0.6.5
	minimal-lexical-0.2.1
	miniz_oxide-0.5.3
	mockall-0.11.2
	mockall_derive-0.11.2
	nix-0.23.1
	nix-0.25.0
	nix-0.26.2
	nom-5.1.2
	nom-7.1.1
	normalize-line-endings-0.3.0
	notify-rust-4.8.0
	nu-ansi-term-0.46.0
	num-derive-0.3.3
	num-integer-0.1.45
	num-traits-0.2.15
	num_cpus-1.13.1
	num_threads-0.1.6
	objc-0.2.7
	objc-foundation-0.1.1
	objc_id-0.1.1
	once_cell-1.17.1
	opaque-debug-0.3.0
	open-3.2.0
	ordered-float-2.10.0
	ordered-multimap-0.4.3
	ordered-stream-0.2.0
	os_info-3.6.0
	os_str_bytes-6.3.0
	overload-0.1.1
	parking-2.0.0
	parking_lot-0.11.2
	parking_lot-0.12.1
	parking_lot_core-0.8.6
	parking_lot_core-0.9.3
	path-slash-0.2.1
	pathdiff-0.2.1
	pathsearch-0.2.0
	percent-encoding-2.1.0
	pest-2.5.5
	pest_derive-2.5.5
	pest_generator-2.5.5
	pest_meta-2.5.5
	phf-0.8.0
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_shared-0.8.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	polling-2.3.0
	ppv-lite86-0.2.16
	predicates-2.1.1
	predicates-core-1.0.3
	predicates-tree-1.0.5
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.47
	process_control-4.0.2
	prodash-23.0.0
	quick-error-2.0.1
	quick-xml-0.23.1
	quick-xml-0.27.1
	quote-1.0.21
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.2.0
	rand_pcg-0.2.1
	rayon-1.6.1
	rayon-core-1.10.0
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.1
	regex-automata-0.1.10
	regex-syntax-0.6.27
	rust-ini-0.18.0
	rustix-0.36.4
	rustversion-1.0.9
	ryu-1.0.11
	same-file-1.0.6
	schemars-0.8.11
	schemars_derive-0.8.11
	scopeguard-1.1.0
	semver-0.11.0
	semver-1.0.16
	semver-parser-0.10.2
	serde-1.0.152
	serde_derive-1.0.152
	serde_derive_internals-0.26.0
	serde_json-1.0.93
	serde_repr-0.1.9
	serde_spanned-0.6.1
	sha1-0.10.5
	sha1-asm-0.5.1
	sha1_smol-1.0.0
	sha2-0.9.9
	sha2-0.10.6
	shadow-rs-0.20.1
	shared_library-0.1.9
	shell-words-1.1.0
	signal-hook-0.1.17
	signal-hook-0.3.14
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	slab-0.4.7
	smallvec-1.9.0
	socket2-0.4.6
	starship-battery-0.7.9
	static_assertions-1.1.0
	strsim-0.10.0
	strum-0.22.0
	strum_macros-0.22.0
	syn-1.0.104
	systemstat-0.2.3
	tauri-winrt-notification-0.1.0
	tempfile-3.4.0
	termcolor-1.1.3
	terminal_size-0.2.5
	terminfo-0.7.3
	termios-0.3.3
	termtree-0.2.4
	termwiz-0.15.0
	thiserror-1.0.37
	thiserror-impl-1.0.37
	time-0.3.17
	time-core-0.1.0
	time-macros-0.2.6
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	toml-0.5.11
	toml-0.7.2
	toml_datetime-0.6.1
	toml_edit-0.19.4
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	typenum-1.15.0
	ucd-trie-0.1.5
	uds_windows-1.0.2
	uluru-3.0.0
	unicase-2.6.0
	unicode-bidi-0.3.8
	unicode-bom-1.1.4
	unicode-ident-1.0.3
	unicode-normalization-0.1.21
	unicode-segmentation-1.10.1
	unicode-width-0.1.10
	unicode-xid-0.2.3
	uom-0.30.0
	url-2.2.2
	urlencoding-2.1.2
	utf8parse-0.2.0
	vcpkg-0.2.15
	version_check-0.9.4
	versions-4.1.0
	vtparse-0.6.2
	waker-fn-1.1.0
	walkdir-2.3.2
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.82
	wasm-bindgen-backend-0.2.82
	wasm-bindgen-macro-0.2.82
	wasm-bindgen-macro-support-0.2.82
	wasm-bindgen-shared-0.2.82
	wepoll-ffi-0.1.2
	which-4.4.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.39.0
	windows-0.43.0
	windows-0.44.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-targets-0.42.1
	windows_aarch64_gnullvm-0.42.1
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.39.0
	windows_aarch64_msvc-0.42.1
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.39.0
	windows_i686_gnu-0.42.1
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.39.0
	windows_i686_msvc-0.42.1
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.39.0
	windows_x86_64_gnu-0.42.1
	windows_x86_64_gnullvm-0.42.1
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.39.0
	windows_x86_64_msvc-0.42.1
	winnow-0.3.0
	winres-0.1.12
	yaml-rust-0.4.5
	zbus-3.10.0
	zbus_macros-3.10.0
	zbus_names-2.5.0
	zvariant-3.10.0
	zvariant_derive-3.10.0
"

inherit cargo

DESCRIPTION="The minimal, blazing-fast, and infinitely customizable prompt for any shell"
HOMEPAGE="https://starship.rs/"
SRC_URI="
	https://github.com/starship/starship/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 CC0-1.0 ISC MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense WTFPL-2 ZLIB"

SLOT="0"
KEYWORDS="amd64"

BDEPEND=">=virtual/rust-1.65"

PATCHES=(
	# https://bugs.gentoo.org/866133
	"${FILESDIR}"/${PN}-1.10.3-no-strip.patch
)

QA_FLAGS_IGNORED="usr/bin/starship"

src_configure() {
	export PKG_CONFIG_ALLOW_CROSS=1
	export OPENSSL_NO_VENDOR=true

	cargo_src_configure
}

src_install() {
	cargo_src_install
	dodoc README.md CHANGELOG.md
}

pkg_postinst() {
	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test "${v}" -lt "1.9.0"; then
			einfo "Note that vicmd_symbol config option was renamed to vimcmd_symbol in version 1.9"
		fi
	done
}
