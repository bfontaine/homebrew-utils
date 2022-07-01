class Closh < Formula
  desc "Bash-like shell based on Clojure"
  homepage "https://github.com/dundalek/closh"
  url "https://github.com/dundalek/closh/releases/download/v0.3.3/closh-zero.jar",
    using: :nounzip
  sha256 "475664d6e2f5aa5ab63263350ef9d4c4aedd738de27ef1da865abdefc3b6f70c"

  def install
    bin.install "closh-zero.jar" => "closh"
  end

  test do
    # We can’t write closh scripts for now
    assert_predicate (bin/"closh"), :executable?
  end
end
