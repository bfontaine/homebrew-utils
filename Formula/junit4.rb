class Junit4 < Formula
  desc "Programmer-oriented testing framework for Java"
  homepage "http://junit.org/"
  url "https://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar",
    using: :nounzip
  sha256 "59721f0805e223d84b90677887d9ff567dc534d7c502ca903c0c2b17f05c116a"

  resource "hamcrest-core" do
    url "https://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar",
      using: :nounzip
    sha256 "66fdef91e9739348df7a096aa384a5685f4e875584cce89386a7a47251c4d8e9"
  end

  def install
    share.install "junit-4.12.jar" => "junit4.jar"
    resource("hamcrest-core").stage do
      share.install Dir["*.jar"]
    end
  end
end
