class Eq < Formula
  desc "EDN equivalent of jq."
  homepage "https://github.com/oscaro/eq"
  url "https://github.com/oscaro/eq/releases/download/0.2.2/eq.js",
    :nounzip => true
  sha256 "ce91294f513cca5c714e372ee9623d5dde11a29fd0bd6f73290fcf6e9956078c"

  depends_on "node" => :run

  def install
    bin.install "eq.js" => "eq"
  end

  test do
    assert_equal "1\n", pipe_output("#{bin}/eq :a", "{:a 1}")
  end
end
