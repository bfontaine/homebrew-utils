class FlynnSslCert < Formula
  desc "Generates Let's Encrypt certificates and updates flynn routes"
  homepage "https://github.com/afgallo/flynn-ssl-cert"
  license "MIT"

  head do
    url "https://github.com/afgallo/flynn-ssl-cert.git"
  end

  def install
    bin.install "gen-cert.sh" => "flynn-ssl-cert"
  end
end
