class Up < Formula
  homepage "https://github.com/bfontaine/up#readme"
  url "https://github.com/bfontaine/up/archive/0.1.5.tar.gz"
  sha1 "d7d1087d051c0fd61cafecaf583f7900fbdf3929"

  def install
    bin.install "bin/up"
    bash_completion.install "utils/up.bash"
  end

  test do
    ENV["COMMANDS"] = pwd+"/foo"
    touch "foo"
    system "#{bin}/up", "--add", "x", "touch y"
    system "#{bin}/up", "x"
    system "#{bin}/up", "--rm", "x"
  end
end
