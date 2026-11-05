# commit: afd48f23282f83e973704b451800e961a2dbcb71
class Huproxyclient < Formula
  desc "Client for huproxy, an HTTPS and WebSocket-based proxy"
  homepage "https://github.com/erikespinoza/huproxy"
  version "2026.10.02"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-darwin-arm64.tar.gz"
      sha256 "0f16876705c2e942e565bfcd72999985f9177deea2109cc32c804519c9f1c90f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/erikespinoza/homebrew-tap/releases/download/huproxyclient-2026.10.02/huproxyclient-2026.10.02-linux-amd64.tar.gz"
      sha256 "73a812293f217499890ee876a1c85bd0740a91d2138ee3aa482be2362e5d7d00"
    end
  end

  def install
    bin.install "huproxyclient"
  end

  test do
    system "#{bin}/huproxyclient", "-h"
  end
end
