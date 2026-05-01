class Taprun < Formula
  desc "Interface automation runtime — programs beat prompts"
  homepage "https://taprun.dev"
  version "0.14.2"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.2/tap-macos-arm64"
      sha256 "4924e59751628c76b5cc12cb80c8e474fbf3eff92d0cefddbc3d7294ee9c4339"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.2/tap-macos-x64"
      sha256 "eb043ead21fa6e29123d70ffd47dfc562f75bee117d1fbf872c951ff36b63659"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      odie "Tap does not support Linux ARM yet"
    else
      url "https://github.com/LeonTing1010/tap/releases/download/v0.14.2/tap-linux-x64"
      sha256 "ad658324c43e888d835e4257821460228805337c31692eb33dbf351962dd0bf7"
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
