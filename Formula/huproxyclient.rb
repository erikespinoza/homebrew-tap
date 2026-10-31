# commit: none
class Huproxyclient < Formula
  desc "Client for huproxy, an HTTPS and WebSocket-based proxy"
  homepage "https://github.com/erikespinoza/huproxy"
  version "2026.10.02"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-darwin-arm64.tar.gz"
      sha256 "8021e20fb2e751f7cffd314f823478b7586696ba395ead6d4808bdb29d5d881c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-linux-amd64.tar.gz"
      sha256 "2159d8b8936b04dfc6660dc1b8a92573a73dff2d0f54d85bc6efc3d1ee5a2ac2"
    end
  end

  def install
    bin.install "huproxyclient"
  end

  test do
    system "#{bin}/huproxyclient", "-h"
  end
end
