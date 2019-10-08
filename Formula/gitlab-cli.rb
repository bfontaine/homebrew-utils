require "language/go"

class GitlabCli < Formula
  desc "A simple command line interface to GitLab"
  homepage ""
  url "https://github.com/makkes/gitlab-cli/archive/v3.2.0.tar.gz"
  sha256 "5cf404e7effb15c6b68211c6a5e5a4b9de65a72d4f899f0793f08e9d02583c96"

  depends_on "go" => :build

  def install
    ln_s buildpath, buildpath/"gitlab-cli"
    cd "gitlab-cli" do
      system "go", "build", "-o", "#{bin}/gitlab-cli",
        "-ldflags", "-X github.com/makkes/gitlab-cli/config.Version=#{version} -X github.com/makkes/gitlab-cli/config.Commit="
    end
  end

  test do
    system bin/"gitlab-cli", "--help"
  end
end
