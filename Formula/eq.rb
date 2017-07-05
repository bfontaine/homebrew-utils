class Eq < Formula
  desc "EDN equivalent of jq."
  homepage "https://github.com/oscaro/eq"
  url "https://github.com/oscaro/eq/releases/download/0.2.1/eq.js",
    :nounzip => true
  sha256 "c9b93333cd3ceac654c53c61032556c23a33f39b7a865f62c9c2355e8564dd17"

  depends_on "node" => :run

  def install
    bin.install "eq.js" => "eq"
  end

  test do
    assert_equal "1\n", pipe_output("#{bin}/eq :a", "{:a 1}")
  end
end
