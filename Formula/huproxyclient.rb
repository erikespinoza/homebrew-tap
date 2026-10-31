class Huproxyclient < Formula
  desc "Client for huproxy, an HTTPS and WebSocket-based proxy"
  homepage "https://github.com/erikespinoza/huproxy"
  version "2026.10.02"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-darwin-arm64.tar.gz"
      sha256 "fe157729d13fa8adff7d7faf5c4b0cc6a513407a59013cfd0ccf30a6b1b0ba33"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-linux-amd64.tar.gz"
      sha256 "32310ccd254375131bfd65c9302956f47230e3b5b21cd6bc9e53fd486a3a4934"
    end
  end

  def install
    bin.install "huproxyclient"
  end

  test do
    system "#{bin}/huproxyclient", "-h"
  end
end
