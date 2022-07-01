class Smuggler < Formula
  desc "Tool to run and build containers with Docker"
  homepage "https://github.com/jbdalido/smg"
  url "https://github.com/jbdalido/smg.git",
    revision: "9bf6185f53fb4d75a004ee27aa5db68def52345e"
  version "0.5.2"

  head "https://github.com/jbdalido/smg.git"

  depends_on "go"

  def install
    # Fix an import path. Should be fixed in the next version
    %w[archive archive_unix changes diff wrap].each do |file|
      inreplace "Godeps/_workspace/src/github.com/docker/docker/pkg/archive/#{file}.go",
        "github.com/jbdalido/smg/Godeps/_workspace/src/github.com/docker/docker/vendor/src/",
        "src/"
    end

    mkdir_p "#{buildpath}/src/github.com/jbdalido/"
    ln_s buildpath, "#{buildpath}/src/github.com/jbdalido/smg"

    ENV["GOPATH"] = buildpath

    system "go", "build", "-o", "#{bin}/smg"
  end

  test do
    system "#{bin}/smg", "-h"
  end
end
