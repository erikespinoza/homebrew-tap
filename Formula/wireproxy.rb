class Wireproxy < Formula
  desc "Wireguard client that exposes itself as a socks5/http proxy"
  homepage "https://github.com/windtf/wireproxy"
  version "1.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/windtf/wireproxy/releases/download/v1.1.3/wireproxy_darwin_arm64.tar.gz"
      sha256 "28d34342c48c309b628d9c06ab4efc05b82fba49821f360605c02139c02547a5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/windtf/wireproxy/releases/download/v1.1.3/wireproxy_darwin_amd64.tar.gz"
      sha256 "5d89742a0f381d9508d3ad828a0d300dceee24fa49015427eaff42a23f7a50bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/windtf/wireproxy/releases/download/v1.1.3/wireproxy_linux_amd64.tar.gz"
      sha256 "e88c1d090740373fc606c1bafd81d9a5eadc642cce5667616e20e9d7a444f51c"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/windtf/wireproxy/releases/download/v1.1.3/wireproxy_linux_arm64.tar.gz"
      sha256 "370e00bd2167960d1ecd1c3c1439715bbaa94a0a110a2040468670c9af6021b6"
    end
  end

  def install
    bin.install "wireproxy"
  end

  test do
    system "#{bin}/wireproxy", "--help"
  end
end
