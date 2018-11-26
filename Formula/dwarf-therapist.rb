class DwarfTherapist < Formula
  desc "Dwarf management tool for Dwarf Fortress"
  homepage "https://github.com/Dwarf-Therapist/Dwarf-Therapist"
  url "https://github.com/Dwarf-Therapist/Dwarf-Therapist/archive/v41.0.3.tar.gz"
  sha256 "72d1a5cd0dfdcb49586403dfbdba31e3d9dfb53d092a427f9f35f8f825686863"

  depends_on "cmake" => :build
  depends_on "qt"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      prefix.install "DwarfTherapist.app"
    end
    bin.write_exec_script "#{prefix}/DwarfTherapist.app/Contents/MacOS/DwarfTherapist"
  end

  test do
    assert_match "Dwarf Therapist #{version}",
      shell_output("#{bin}/DwarfTherapist --version")
  end
end
