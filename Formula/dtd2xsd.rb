class Dtd2xsd < Formula
  homepage "http://www.w3.org/2000/04/schema_hack/"
  url "http://lists.xml.org/archives/xml-dev/200101/bin00000.bin", :using => :nounzip
  sha1 "6631137937e5e6549f387847159bea89bc88c021"
  version "2001-01-10"

  def install
    # replace hard-coded perl
    inreplace "bin00000.bin", "perl\r", "/usr/bin/perl"
    bin.install "bin00000.bin" => "dtd2xsd"
  end

  test do
    (testpath/"test.dtd").write "<!ELEMENT foo EMPTY #REQUIRED>"
    system "#{bin}/dtd2xsd", testpath/"test.dtd"
  end
end
