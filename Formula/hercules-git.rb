require "language/go"

class HerculesGit < Formula
  include Language::Python::Virtualenv

  desc "CLI tool to get insights from a git repository history"
  homepage "https://github.com/src-d/hercules"
  url "https://github.com/src-d/hercules/archive/v10.2.0.tar.gz"
  sha256 "3e5a8ee5f048643aef4101d70809c089b8ca91b5d95636d68961da7a64555ea8"

  depends_on "dep" => :build
  depends_on "go" => :build
  depends_on "protobuf" => :build
  depends_on "python"

  go_resource "gopkg.in/src-d/go-git.v4" do
    url "https://github.com/src-d/go-git.git",
      tag: "v4.12.0"
  end

  go_resource "gopkg.in/bblfsh/sdk.v2" do
    url "https://github.com/bblfsh/sdk.git",
      tag: "v2.16.4"
  end

  go_resource "gopkg.in/src-d/enry.v1" do
    url "https://github.com/src-d/enry.git",
      tag: "v1.7.3"
  end

  go_resource "gopkg.in/src-d/go-billy.v4" do
    url "https://github.com/src-d/go-billy.git",
      tag: "v4.3.1"
  end

  go_resource "gopkg.in/src-d/go-errors.v1" do
    url "https://github.com/src-d/go-errors.git",
      tag: "v1.0.0"
  end

  go_resource "gopkg.in/toqueteos/substring.v1" do
    url "https://github.com/toqueteos/substring.git",
      tag: "v1.0.2"
  end

  go_resource "golang.org/x/crypto" do
    url "https://go.googlesource.com/crypto.git",
      revision: "4def268fd1a49955bfb3dda92fe3db4f924f2285"
  end

  go_resource "github.com/xanzy/ssh-agent" do
    url "https://github.com/xanzy/ssh-agent.git",
      tag: "v0.2.1"
  end

  go_resource "golang.org/x/net" do
    url "https://go.googlesource.com/net.git",
      revision: "da137c7871d730100384dbcf36e6f8fa493aef5b"
  end

  go_resource "golang.org/x/sys" do
    url "https://go.googlesource.com/sys.git",
      revision: "04f50cda93cbb67f2afa353c52f342100e80e625"
  end

  go_resource "gopkg.in/bblfsh/client-go.v3" do
    url "https://github.com/bblfsh/client-go.git",
      tag: "v3.2.1"
  end

  go_resource "github.com/toqueteos/trie" do
    url "https://github.com/toqueteos/trie.git",
      tag: "v1.0.0"
  end

  go_resource "google.golang.org/grpc" do
    url "https://github.com/grpc/grpc-go.git",
      tag: "v1.22.0"
  end

  go_resource "gopkg.in/bblfsh/sdk.v1" do
    url "https://github.com/bblfsh/sdk.git",
      tag: "v1.17.0"
  end

  go_resource "github.com/src-d/gcfg" do
    url "https://github.com/src-d/gcfg.git",
      tag: "v1.4.0"
  end

  go_resource "golang.org/x/text" do
    url "https://go.googlesource.com/text.git",
      revision: "342b2e1fbaa52c93f31447ad2c6abc048c63e475"
  end

  go_resource "google.golang.org/genproto" do
    url "https://github.com/googleapis/go-genproto.git",
      revision: "710ae3a149df3775bfc2e9efb7f4fb97b186b233"
  end

  go_resource "github.com/pkg/errors" do
    url "https://github.com/pkg/errors.git",
      tag: "v0.8.1"
  end

  go_resource "github.com/sergi/go-diff" do
    url "https://github.com/sergi/go-diff.git",
      tag: "v1.0.0"
  end

  go_resource "github.com/spf13/cobra" do
    url "https://github.com/spf13/cobra.git",
      tag: "0.0.5"
  end

  go_resource "gopkg.in/warnings.v0" do
    url "https://github.com/go-warnings/warnings.git",
      tag: "v0.1.2"
  end

  go_resource "github.com/mcuadros/go-lookup" do
    url "https://github.com/mcuadros/go-lookup.git",
      revision: "5650f26be7675b629fff8356a50d906fa03e9c8b"
  end

  go_resource "github.com/minio/highwayhash" do
    url "https://github.com/minio/highwayhash.git",
      tag: "v1.0.0"
  end

  go_resource "github.com/mitchellh/go-homedir" do
    url "https://github.com/mitchellh/go-homedir.git",
      tag: "v1.1.0"
  end

  go_resource "github.com/opentracing/opentracing-go" do
    url "https://github.com/opentracing/opentracing-go.git",
      tag: "v1.1.0"
  end

  go_resource "github.com/golang/protobuf" do
    url "https://github.com/golang/protobuf.git",
      tag: "v1.3.1"
  end

  go_resource "github.com/grpc-ecosystem/grpc-opentracing" do
    url "https://github.com/grpc-ecosystem/grpc-opentracing.git",
      revision: "8e809c8a86450a29b90dcc9efbf062d0fe6d9746"
  end

  go_resource "github.com/jbenet/go-context" do
    url "https://github.com/jbenet/go-context.git",
      revision: "d14ea06fba99483203c19d92cfcd13ebe73135f4"
  end

  go_resource "github.com/kevinburke/ssh_config" do
    url "https://github.com/kevinburke/ssh_config.git",
      tag: "0.5"
  end

  go_resource "github.com/spf13/pflag" do
    url "https://github.com/spf13/pflag.git",
      tag: "v1.0.3"
  end

  go_resource "github.com/gogo/protobuf" do
    url "https://github.com/gogo/protobuf.git",
      tag: "v1.2.1"
  end

  go_resource "github.com/BurntSushi/toml" do
    url "https://github.com/BurntSushi/toml.git",
      tag: "v0.3.1"
  end

  go_resource "github.com/Jeffail/tunny" do
    url "https://github.com/Jeffail/tunny.git",
      tag: "0.1.2"
  end

  go_resource "github.com/antchfx/xpath" do
    url "https://github.com/antchfx/xpath.git",
      tag: "v1.0.0"
  end

  go_resource "github.com/pelletier/go-buffruneio" do
    url "https://github.com/pelletier/go-buffruneio.git",
      tag: "v0.2.0"
  end

  go_resource "github.com/emirpasic/gods" do
    url "https://github.com/emirpasic/gods.git",
      tag: "v1.12.0"
  end

  go_resource "github.com/Masterminds/sprig" do
    url "https://github.com/Masterminds/sprig.git",
      tag: "v2.20.0"
  end

  go_resource "github.com/fatih/camelcase" do
    url "https://github.com/fatih/camelcase.git",
      tag: "v1.0.0"
  end

  go_resource "gopkg.in/cheggaaa/pb.v1" do
    url "https://github.com/cheggaaa/pb.git",
      tag: "v1.0.28"
  end

  go_resource "gopkg.in/src-d/go-billy-siva.v4" do
    url "https://github.com/src-d/go-billy-siva.git",
      tag: "v4.5.1"
  end

  go_resource "gopkg.in/src-d/go-siva.v1" do
    url "https://github.com/src-d/go-siva.git",
      tag: "v1.5.0"
  end

  go_resource "github.com/mattn/go-runewidth" do
    url "https://github.com/mattn/go-runewidth.git",
      tag: "v0.0.4"
  end

  go_resource "github.com/imdario/mergo" do
    url "https://github.com/imdario/mergo.git",
      tag: "v0.3.7"
  end

  go_resource "github.com/huandu/xstrings" do
    url "https://github.com/huandu/xstrings.git",
      tag: "v1.2.0"
  end

  go_resource "github.com/google/uuid" do
    url "https://github.com/google/uuid.git",
      tag: "v1.1.1"
  end

  go_resource "github.com/Masterminds/semver" do
    url "https://github.com/Masterminds/semver.git",
      tag: "v1.4.2"
  end

  go_resource "github.com/Masterminds/goutils" do
    url "https://github.com/Masterminds/goutils.git",
      tag: "v1.1.0"
  end

  def install
    ENV["GOPATH"] = buildpath
    srcpath = "src/gopkg.in/src-d/hercules.v10"
    (buildpath/srcpath).install buildpath.children
    Language::Go.stage_deps resources, buildpath/"src"
    cd srcpath do
      system "go", "build"
      cd "cmd/hercules" do
        system "go", "generate"
      end
      system "go", "build", "-o", "#{bin}/hercules", "./cmd/hercules"
      system "protoc", "--python_out", "internal/pb", "--proto_path=internal/pb", "internal/pb/pb.proto"

      venv = virtualenv_create(libexec, "python3")
      cd "python" do
        system libexec/"bin/pip", "install", "-e", "."
        venv.pip_install_and_link buildpath/"#{srcpath}/python"
        bin.install_symlink libexec/"bin/labours"
      end
      prefix.install_metafiles
    end
  end

  test do
    system "#{bin}/hercules", "--help"
    system "#{bin}/labours", "--help"
  end
end
