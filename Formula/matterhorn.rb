require "language/haskell"

class Matterhorn < Formula
  include Language::Haskell::Cabal

  desc "Terminal client for the Mattermost chat system"
  homepage "https://github.com/matterhorn-chat/matterhorn"
  url "https://github.com/matterhorn-chat/matterhorn/archive/40800.0.3.tar.gz"
  sha256 "6a60b1256187d32275a38718bdd8e83b5a0ab8dd11df4fe2d80d90ba50b10dd5"

  resource "mattermost-api" do
    url "https://github.com/matterhorn-chat/mattermost-api/archive/40800.0.2.tar.gz"
    sha256 "b11b1033605f9cf7925f0bfa8e3613c4eb495cd95f9c8bf90c529929b494fe39"
  end

  resource "mattermost-api-qc" do
    url "https://github.com/matterhorn-chat/mattermost-api-qc/archive/40800.0.2.tar.gz"
    sha256 "1d1a872a3a656e37698f22e19f1c38bcca383284284d25159e863f92a5caf773"
  end

  resource "aspell-pipe" do
    url "https://github.com/matterhorn-chat/aspell-pipe/archive/0.3.tar.gz"
    sha256 "06e9ba32f9046133ee0435ba0ecbd5e1781e795e458d92a2686a99f354316190"
  end

  depends_on "cabal-install" => :build

  def install
    packages = []

    resources.each do |r|
      r.stage buildpath/"deps/#{r.name}"
      packages << "deps/#{r.name}/#{r.name}.cabal"
    end

    (buildpath/"cabal.project.local").write <<~EOS
      packages: #{packages.join("\n          ")}
    EOS

    install_cabal_package :using => ["happy"]
  end

  test do
    assert_match "matterhorn #{version}\n",
      shell_output("#{bin}/matterhorn -v")
  end
end
