class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.6"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.6/tap-macos-arm64"
      sha256 "2f300e82b42cc55b207e8e69e384ab14f945f0e801d45546d3cd5784436535df"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.6/tap-macos-x64"
      sha256 "f67a285d84a910678538e4d5cd49973f8d3baccf854a5e64abf966e33511cdda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.6/tap-linux-x64"
      sha256 "c12c2e0e3e4228f3223f3102a384ee331c514d42327fad5adf1910f65f29db5a"
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
