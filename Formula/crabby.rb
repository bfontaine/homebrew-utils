class Crabby < Formula
  desc "Web page performance tester"
  homepage "https://github.com/chrissnell/crabby"
  url "https://github.com/chrissnell/crabby.git",
    # asked upstream for a tag: https://github.com/chrissnell/crabby/issues/26
    commit: "7909a1dfaf2508676416715a2790c2da21a48ef4"
  version "2.0"
  license "WTFPL"

  head "https://github.com/chrissnell/crabby.git"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", "crabby"
    bin.install "crabby"
  end

  test do
    system bin/"crabby", "-h"
  end
end
