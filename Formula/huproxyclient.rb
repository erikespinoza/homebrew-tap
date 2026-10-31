class Huproxyclient < Formula
  desc "Client for huproxy, an HTTPS and WebSocket-based proxy"
  homepage "https://github.com/erikespinoza/huproxy"
  version "2026.10.02"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "huproxyclient"
  end

  test do
    system "#{bin}/huproxyclient", "-h"
  end
end
