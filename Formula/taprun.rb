class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.14.0"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.0/tap-macos-arm64"
      sha256 "067a17de96c293e1bbd9bad0eb95b6a567c5dc50e9e732d648231dec11e41547"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.0/tap-macos-x64"
      sha256 "b4b1450e815f4260fa0ce123b634583749887c7ceb68e1dad5816c5e46d550de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.0/tap-linux-x64"
      sha256 "9a8975b42d3ee550b072360620ae2d5eb86654e98ab015903709952895bc569f"
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
