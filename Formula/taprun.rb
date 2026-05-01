class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.14.5"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.5/tap-macos-arm64"
      sha256 "4771768c744dfd687305ed5369f4462ab231d7a5b191902a2c6283b6b3182263"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.5/tap-macos-x64"
      sha256 "6a040a820b5ca1b40d407574f8fba185484f7d4038ae855bc6f815f4c7bfc349"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.5/tap-linux-x64"
      sha256 "33a88cdbeb8e0683831634bf73b73777a5e02d5b82ef363953eda5ab184c565e"
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
