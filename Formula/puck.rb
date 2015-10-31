class Puck < Formula
  desc "Program for the analysis of kinship network morphologies"
  homepage "https://www.kinsources.net/editorial/tools.xhtml"
  url "http://kintip.net/index.php?option=com_jdownloads&task=download.send&id=217&catid=3&m=0",
    :using => :nounzip
  version "2.2.13"
  sha256 "56fe2cf212171e0bd6dd5c3ce71d3a62c03926db7e22b0102f3ff2fec5e90612"

  depends_on :java => "1.6+"

  def install
    libexec.install "index.php" => "puck.jar"
    bin.write_jar_script libexec/"puck.jar", "puck"
  end

  test do
    system "#{bin}/puck", "-h"
  end
end
