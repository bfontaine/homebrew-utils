class Up < Formula
  homepage "https://github.com/bfontaine/up#readme"
  url "https://github.com/bfontaine/up/archive/0.1.5.tar.gz"
  sha256 "d5d4e3bda88871fa67117c9ed8f7f900271e2f1c5a0e0a13bbffb7071cca91f9"

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
