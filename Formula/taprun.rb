class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.14"
  license :cannot_represent
  # `brew install LeonTing1010/tap/tap` (the original install command in
  # docs / blog posts / user terminals) must continue to resolve. Per
  # ADR `2026-05-09-userspace-via-standards.md` Tier 0: install command
  # strings frozen by user keystroke; rename = userspace break unless
  # the old name keeps resolving. Homebrew's `oldname` is the idiomatic
  # alias mechanism. Replaces the v0.4.0 orphan Formula/tap.rb.
  oldname "tap"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.14/tap-macos-arm64"
      sha256 "4b6b0a6890dff1ec6815c56e40d42c30de552dacb9fa59d4cff9943a148ab777"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.14/tap-macos-x64"
      sha256 "cceb9a5a30237b77f7f23be275c7faa8e434a338d30bdce69f0b27ec75d7a20b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.14/tap-linux-x64"
      sha256 "0233713934803c44f7dc080fccbc904db3133256e2aea530ff9437c25d84ceb1"
    end
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "tap"
  end

  test do
    system "#{bin}/tap", "config", "list"
  end
end
