class GitVanitySha < Formula
  desc "Vanity hex prefixes for your commit SHAs"
  homepage "https://github.com/mattbaker/git-vanity-sha"
  head "https://github.com/mattbaker/git-vanity-sha.git"

  def install
    bin.install "git-vanity-sha"
  end

  test do
    system "git", "init"
    system "git", "config", "user.email", "git-vanity-sha@test.example.com"
    system "git", "commit", "--allow-empty", "-m", "test"
    assert_match "SHA found:",
      pipe_output("#{bin}/git-vanity-sha a", "y\n")
  end
end
