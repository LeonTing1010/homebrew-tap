class Tap < Formula
  desc "The interface protocol for AI agents - forge once, run forever"
  homepage "https://github.com/LeonTing1010/tap"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.4.0/tap-aarch64-apple-darwin.tar.gz"
      sha256 "3ed69d2ad6f41194fb14508930c6c0d613694c180ddce7bd1bbfe33a2c38df76"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.4.0/tap-x86_64-apple-darwin.tar.gz"
      sha256 "9aa18cbde76f6927e2f00b21791629bd4c9434e39dec324af6ae34a10584faaf"
    end
  end

  on_linux do
    url "https://github.com/LeonTing1010/tap/releases/download/v0.4.0/tap-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3fa512c55ce2d39aefb2958ff753dbcf52445c4454bc18f1e1b804a23fd939d9"
  end

  def install
    bin.install "tap"
  end

  test do
    assert_match "tap", shell_output("#{bin}/tap --help 2>&1", 1)
  end
end
