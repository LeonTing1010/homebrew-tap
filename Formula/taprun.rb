class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.15.7"
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
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.7/tap-macos-arm64"
      sha256 "57413976d788c56dd74e49a32a587f8668a83eb5aded7029025eaf1c95eca3f4"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.7/tap-macos-x64"
      sha256 "b1ce702207091bb1a4a4a516ed4a6cc1dd62178bc22a9b4f164e02cfde3a2029"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.15.7/tap-linux-x64"
      sha256 "0e3190963b3799318f1fa2d780992bd297e340dac9e8ffe7dc0180db9e9a23bc"
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
