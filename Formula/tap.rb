class Tap < Formula
  desc "The interface protocol for AI agents - forge once, run forever"
  homepage "https://github.com/LeonTing1010/tap"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v#{version}/tap-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v#{version}/tap-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    url "https://github.com/LeonTing1010/tap/releases/download/v#{version}/tap-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "PLACEHOLDER"
  end

  def install
    bin.install "tap"
  end

  test do
    assert_match "tap", shell_output("#{bin}/tap --help 2>&1", 1)
  end
end
