class Puck < Formula
  desc "Program for the analysis of kinship network morphologies"
  homepage "https://www.kinsources.net/editorial/tools.xhtml"
  url "http://kintip.net/index.php?option=com_jdownloads&task=download.send&id=255&catid=3&m=0"
  version "2.3.58"
  sha256 "6440d4a243af3e79c29b3612f9dd859e3932306ad37e24bee5ca7fb1578cdaab"

  depends_on :java => "1.6+"

  def install
    libexec.install "puck-#{version}/puck.jar"
    bin.write_jar_script libexec/"puck.jar", "puck"
  end

  test do
    system "#{bin}/puck", "-h"
  end
end
