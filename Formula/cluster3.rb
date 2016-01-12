class Cluster3 < Formula
  desc "Enhanced version of Cluster"
  homepage "http://bonsai.hgc.jp/~mdehoon/software/cluster/software.htm"
  url "http://bonsai.hgc.jp/~mdehoon/software/cluster/cluster-1.52a.tar.gz"
  sha256 "e503a1b4680341a516b28804b3bfdbdefd7d8f01a0db659da7cb23f708ac1cd1"

  depends_on :x11
  depends_on "homebrew/x11/openmotif"

  conflicts_with "graphviz", :because => "both install `cluster` binaries"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/cluster", "-v"
  end
end
